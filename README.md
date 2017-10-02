# Beep::EventsManager



## Installation

```ruby
gem "beep-events_manager", :github => "beep-saude/beep-events-manager", :tag => "0.1.3"
```
Criando o database
```sql
CREATE DATABASE beep_events
CREATE TABLE events (id SERIAL, object_id integer, date timestamp, event_name varchar(100), event_data json, object_domain varchar(30), object_type varchar(30))
```
crie o arquivo de configuração no initializer event_manager_config.rb
```ruby
config = Beep::EventsManager::Config.instance
config.object_domain = "app-name"
config.database_config = { dbname: "beep_events", user: "", host: "localhost", sslmode: 'disable' }
```

## Usage

### Publicar um evento

```ruby
  events_service = Beep::EventsManager::EventsService.new
  events_service.publish( event_name: "seu-evento", object_id: 1, object_type: "Call", object_data: { foo: "bar" } )
```

### Listar os eventos de um objeto

```ruby
  events_service = Beep::EventsManager::EventsService.new
  events_service.list_events( object_id: 1, object_type: "Call", object_domain: "app-name" )
```
