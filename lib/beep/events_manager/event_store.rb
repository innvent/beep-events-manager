module Beep
  module EventsManager

    class EventStore

        def initialize
          @rep = EventRepository.new
        end

        def store(event)
          event.object_domain = Beep::EventsManager::Config.instance.object_domain || event.object_domain
          event.save
        end

        def list object_id, object_type, object_domain
          events = @rep.get_by_object_id object_id, object_type, object_domain
          events.map { |event| event.to_hash }
        end

        def list_after_id event_id, options: {}
          events = @rep.list_all_after_id(event_id, options: options)
          events.map { |event| event.to_hash }
        end

    end
  end
end
