module Beep
  module EventsManager

    class EventStore

        def initialize
          @rep = EventsManager::EventRepository.new
        end

        def store(event)

          event = @rep.create(object_domain: ::Beep::EventsManager::Config.instance.object_domain,
                              object_type: event.object_type,
                              object_id: event.object_id,
                              event_name: event.event_name,
                              event_data: event.event_data )

          event

        end

        def list object_id, object_type
          @rep.get_by_object_id object_id, object_type
        end
    end

  end
end
