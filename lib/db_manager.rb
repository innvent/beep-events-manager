require 'pg'
require  'singleton'

class DbManager

  def self.instance
    DbManager.new
  end

  def execute(sql, args = [])
    conn   = create_connection
    conn.prepare('clausure', sql)
    result = conn.exec_prepared('clausure', args)
    conn.close

    result
  end

  private

    def create_connection
      PG.connect( host: get_config_value(:host),
                  hostaddr: get_config_value(:hostaddr),
                  dbname: get_config_value(:dbname),
                  port: get_config_value(:port),
                  user: get_config_value(:user),
                  connect_timeout: get_config_value(:connect_timeout),
                  sslmode: get_config_value(:sslmode),
                  password: get_config_value(:password) )
    end

    def get_config_value(field)
      value = Beep::EventsManager::Config.instance.database_config[field]
      return (value == "") ? nil : value
    end

end
