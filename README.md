# Beep::EventsManager



## Installation
Add this line to your application's Gemfile:

```ruby
gem "beep-events_manager", :github => "beep-saude/beep-events-manager", :tag => "0.1.1"
```

And then execute:

    $ bundle
    
## Criando o database
```sql
CREATE DATABASE beep_events
CREATE TABLE events (id SERIAL, object_id integer, date timestamp, event_data json, object_domain varchar(30), object_type varchar(30))
```

### crie o arquivo de configuração no initializer event_manager_config.rb
```ruby
config = Beep::EventsManager::Config.instance
config.object_domain = "app-name"
config.database_config = {dbname:"beep_events", user:"", host:"localhost", sslmode:'disable'}
```

## Usage
