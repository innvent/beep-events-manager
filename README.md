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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/beep-events_manager.

