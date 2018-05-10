require  'singleton'

module Beep
  module EventsManager

    class Config

       include Singleton

      attr_accessor :object_domain, :database_config

      def configure_with(configuration)
        self.database_config = configuration
        Event.establish_connection(self.connection_config)
      end


      def load_configurations(data)
        @object_domain = data['object_domain']
        @database_config = data['database_config']
      end

      def connection_config
      {
        adapter: get_config_value(:adapter) || 'postgresql',
        encoding: "unicode",
        database: get_config_value(:dbname),
        host: get_config_value(:host),
        port: get_config_value(:port),
        username: get_config_value(:user),
        password: get_config_value(:password)
      }
      end

      def get_config_value(field)
        value =self.database_config[field]
        return (value == "") ? nil : value
      end

    end

  end
end
