module Beep
  module EventsManager

    class EventStore

        def initialize
          @rep = EventRepository.new
        end

        def store(event)

          object_domain = Beep::EventsManager::Config.instance.object_domain || event.object_domain

          @rep.create(object_domain: object_domain,
                              object_type: event.object_type,
                              object_id: event.object_id,
                              event_name: event.event_name,
                              event_data: event.event_data )
        end

        def list object_id, object_type, object_domain
          events = @rep.get_by_object_id object_id, object_type, object_domain
          events.map { |event| event.to_hash }
        end

    end
  end
end
