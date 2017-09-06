# Beep::EventsManager



## Installation
### Criando o database
```sql
CREATE DATABASE beep_events
CREATE TABLE events (id SERIAL, object_id integer, date timestamp, event_data json, object_domain varchar(30), object_type varchar(30))
```

Add this line to your application's Gemfile:

```ruby
gem 'beep-events_manager'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beep-events_manager

## Usage