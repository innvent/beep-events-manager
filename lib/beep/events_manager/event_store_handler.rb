module Beep
  module EventsManager
    class EventStoreHandler

      def self.build
        EventStoreHandler.new( EventStore.new )
      end

      def initialize(event_store)
        @event_store = event_store
      end

      def notify(event)
        @event_store.store(event)
      end
    end
  end
end