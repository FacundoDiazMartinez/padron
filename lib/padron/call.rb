module Padron
	class Call

		attr_reader :client, :environment, :body, :data, :fault_code, :id

		def initialize(args={})
			@environment = args[:environment] || :test
			@id = args[:id] || raise(NullOrInvalidAttribute.new, "Por favor ingrese el documento.")
		end

		def dummy
			set_client
			pp reponse = client.call(:dummy)
		end

		def get_data
	  		@data = get_personas
	  		return nil unless fault_code.nil?
	  		set_data
	  	end

		def get_personas
			set_client
			set_body
			response = client.call(:get_persona_list, message: body)
			rescue Savon::SOAPFault => error
		  	if !error.blank?
		  		@fault_code = error.to_hash[:fault][:faultstring]
		  	else
		  		@fault_code = nil
		  	end
		  	return response
		end

		private

			def set_client
				Padron::AuthData.fetch
				@client = Savon.client(
			        wsdl:  service_url,
			        log_level:  :debug,
			        ssl_cert_key_file: Padron.pkey,
			        ssl_cert_file: Padron.cert,
			        ssl_verify_mode: :none,
			        read_timeout: 90,
			        open_timeout: 90,
			        headers: { "Accept-Encoding" => "gzip, deflate", "Connection" => "Keep-Alive" }
			    )
			end

			def set_body
				ids = Padron::IdPersona.new(id).return_cuits
				body = Padron.auth_hash
				id_personas = []
				ids.map do |cuit|
					id_personas << cuit
				end
				@body = body.merge({"idPersona" => id_personas})
			end

			def service_url
				Padron::URLS[environment][:padron]
			end

	  		def set_data
	  			personas = data.body[:get_persona_list_response][:persona_list_return][:persona]
	  			personas.map do |persona|
	  				unless persona[:error_constancia] && persona[:error_constancia].try(:[],:apellido).nil?
		  				if !persona[:error_constancia].nil?
					  		{:name 			=> set_name(persona[:error_constancia]),
				  			:cuit 			=> persona[:error_constancia][:id_persona]}
				  		else
					  		{:name 			=> set_name(persona[:datos_generales]),
				  			:cuit 			=> persona[:datos_generales][:id_persona],
				  			:cp 			=> persona[:datos_generales].try(:[], :domicilio_fiscal).try(:[], :cod_postal),
				  			:address 		=> persona[:datos_generales].try(:[], :domicilio_fiscal).try(:[], :direccion),
				  			:city_id 		=> persona[:datos_generales].try(:[], :domicilio_fiscal).try(:[], :id_provincia),
				  			:city 			=> Padron::PROVINCIAS[persona[:datos_generales].try(:[],:domicilio_fiscal).try(:[], :id_provincia)],
				  			:locality 		=> persona[:datos_generales].try(:[], :domicilio_fiscal).try(:[], :localidad)}
				  		end
				  	end
				end
		  	end

	  		def set_name(persona)
	  			return "#{persona.try(:[], :nombre)} #{persona.try(:[], :apellido)}"
	  		end
	end
end