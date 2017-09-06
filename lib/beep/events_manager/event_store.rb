module Beep
  module EventsManager

    class EventStore

          def store(event)
            # Event.create(
            #   name: event.name,
            #   date: event.date,
            #   object_type: event.object_type,
            #   object_id: event.object_id,
            #   event_data: event.event_data
            # )



            conn = PG.connect( dbname: 'beep_events' )

            conn.exec("CREATE TABLE events (id SERIAL, object_id integer, date timestamp, event_data json, object_domain varchar(30), object_type varchar(30))")
            conn.exec( "SELECT * FROM events" ) do |result|              
              result.each do |row|                
                p row.values_at('id', 'object_id', 'event_data')
              end
            end
            puts event
            "xxxxx"
          end
                

      end
    end
end

  
  