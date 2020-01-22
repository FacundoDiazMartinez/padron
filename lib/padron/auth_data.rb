module Padron

  class AuthData

    class << self

      attr_accessor :environment, :todays_data_file_name

      def fetch
        unless File.exists?(Padron.pkey)
          raise "Archivo de llave privada no encontrado en #{ Padron.pkey }"
        end

        unless File.exists?(Padron.cert)
          raise "Archivo certificado no encontrado en #{ Padron.cert }"
        end

        unless File.exists?(todays_data_file_name)
          Padron::Wsaa.login
        end

        YAML.load_file(todays_data_file_name).each do |k, v|
          Padron.const_set(k.to_s.upcase, v) #unless Padron.const_defined?(k.to_s.upcase)
        end
      end

      def auth_hash
        fetch unless Padron.constants.include?(:TOKEN) && Padron.constants.include?(:SIGN)
        { 'token' => Padron::TOKEN, 'sign'  => Padron::SIGN, 'cuitRepresentado'  => Padron.cuit }
      end


      def wsaa_url
        Padron::URLS[Padron.environment][:wsaa]
      end

      def wsfe_url
        raise 'Environment not sent to either :test or :production' unless Padron::URLS.keys.include? environment
        Padron::URLS[Padron.environment][:wsfe]
      end

      def todays_data_file_name
        @todays_data_file ||= "/tmp/padron_a5_#{Padron.environment.to_s}_Padron_#{ Padron.cuit }_#{ Time.new.strftime('%Y_%m_%d') }.yml"
      end
    end
  end
end