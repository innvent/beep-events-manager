
module Moo
  module EventsManager
    class EventRepository

      def create(object_id:, event_name:, event_data:, object_domain:, object_type:)
        Event.create(object_id: object_id, event_name: event_name, event_data: event_data, object_domain: object_domain)
      end

      def get_by_object_id id, object_type, object_domain
        Event.where(object_id: id, object_type: object_type, object_domain: object_domain).order(date: :asc)
      end

      def list_all_after_date date, options: {}
        Event.where("date > ?", date).where(options).order(date: :asc)
      end

    end
  end
end