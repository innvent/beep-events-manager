
module Beep
  module EventsManager
    class EventRepository

      def create(object_id:, event_name:, event_data:, object_domain:, object_type:)
        Event.create(object_id: object_id, event_name: event_name, event_data: event_data, object_domain: object_domain)
      end

      def get_by_object_id id, object_type, object_domain
        Event.where(object_id: id, object_type: object_type, object_domain: object_domain)
      end

      def list_all_after_id event_id, options: {}
        Event.where("id > ?", event_id).where(options).order(id: :asc)
      end

    end
  end
end

