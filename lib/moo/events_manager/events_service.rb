module Moo
  module EventsManager
    class EventsService

      def initialize
        @event_store = EventStore.new
        @event_factory = EventFactory.new
      end

      def publish event_name:, event_data:, object_id:, object_type:
        event = @event_factory.build( object_id: object_id, object_type: object_type, event_name: event_name, event_data: event_data )
        @event_store.store( event )
      end

      def list_events object_id:, object_type:, object_domain:
        @event_store.list( object_id, object_type, object_domain )
      end

      def list_events_after_date date:, options: {}
        @event_store.list_all_after_date( date, options: options )
      end

    end
  end
end