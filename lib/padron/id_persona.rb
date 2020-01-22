module Padron
	class IdPersona
		attr_reader :id

		def initialize(id)
			@id = id
		end

		def return_cuits
			return id if id.length == 11
			return calculate_cuits
		end

		def calculate_cuits
	  		ids = []
	  		%w(F M).each do |tipo|
	  			ids << calculate_z(tipo)
	  		end
	  		return ids
	  	end

	  	def calculate_z tipo
	  		multiplicador = "2345672345"
	  		case tipo
	  		when "F"
	  			xy = 27
	  			xy_dni = "27#{id}"
	  		when "M"
	  			xy = 20
	  			xy_dni = "20#{id}"
	  		end
	  		verificador = 0
	  		(0..9).each do |i|
	  			verificador += (xy_dni.reverse[i].to_i * multiplicador[i].to_i)
	  		end
	  		verificador
	  		z = verificador - (verificador / 11 * 11)

	  		case z
	  		when 0
	  			z = 0
	  		when 1
	  			if tipo == "M"
	  				z = 9
	  				xy = 23
	  			elsif tipo == "F"
	  				z = 4
	  				xy = 23
	  			else
	  				z = 11 - z
	  			end
	  		else
	  			z = 11 - z
	  		end
	  		return "#{xy}#{id}#{z}"
	  	end
	end
end