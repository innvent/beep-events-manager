module Beep
  module EventsManager
    class EventFactory

      def build id: nil, object_domain: nil,  object_id:, object_type:, event_name:, event_data:
        event = Event.new id: id,
                          object_domain: object_domain,
                          object_id: object_id,
                          date: Time.zone.now,
                          event_name: event_name,
                          event_data: event_data,
                          object_type: object_type
        event
      end

    end
  end
end
