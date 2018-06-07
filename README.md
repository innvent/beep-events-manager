# EventsManager



## Installation

```ruby
gem "moo-events_manager", :github => "innvent/moo-events-manager", :tag => "1.0.1"
```
Criando o database
```sql
CREATE DATABASE moo_events
CREATE TABLE events (id bigserial primary key, object_id integer, date timestamp, event_name varchar(100), event_data json, object_domain varchar(30), object_type varchar(30))
```
crie o arquivo de configuração no initializer event_manager_config.rb
```ruby
config = Moo::EventsManager::Config.instance
config.object_domain = "app-name"
config.configure_with({ dbname: "moo_events", user: "", host: "localhost", sslmode: 'disable'})
```

## Usage

### Publicar um evento

```ruby
  events_service = Moo::EventsManager::EventsService.new
  events_service.publish( event_name: "seu-evento", object_id: 1, object_type: "Call", object_data: { foo: "bar" } )
```

### Listar os eventos de um objeto

```ruby
  events_service = Moo::EventsManager::EventsService.new
  events_service.list_events( object_id: 1, object_type: "Call", object_domain: "app-name" )
```

## Corrigir problema de tabela de eventos com id sem pk

Remover ids duplicados
```sql
DELETE FROM events
  WHERE ctid = ANY(ARRAY(SELECT ctid
                  FROM (SELECT row_number() OVER (PARTITION BY id), ctid
                           FROM events) x
                 WHERE x.row_number > 1));
```

Alterar a tabela para adicionar primary key
```sql
ALTER TABLE events ADD PRIMARY KEY (id);
```
