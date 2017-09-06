require 'pg'
require  'singleton'

class DbManager

  include Singleton

  def initialize
    @db_config = 
    @conn = PG.connect( host: get_config_value(:host), 
                        hostaddr: get_config_value(:hostaddr), 
                        dbname: get_config_value(:dbname), 
                        port: get_config_value(:port),
                        user: get_config_value(:user), 
                        connect_timeout: get_config_value(:connect_timeout), 
                        sslmode: get_config_value(:sslmode),
                        password: get_config_value(:password) )
  end

  def execute(sql)
    @conn.exec(sql)
  end

  private
    def get_config_value(field)
      value = Beep::EventsManager::Config.instance.database_config[field]
      return (value == "") ? nil : value
    end

end