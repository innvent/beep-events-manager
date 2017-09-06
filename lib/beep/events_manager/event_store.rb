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

          rep = EventsManager::EventRepository.new
          event = rep.create( name: event.name,
                              object_domain: ::Beep::EventsManager::Config.instance.object_domain,
                              object_type: event.object_type,
                              object_id: event.object_id,
                              event_data: event.event_data )


          
        end
    end

  end
end

  
  