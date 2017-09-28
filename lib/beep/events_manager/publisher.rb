module Beep
  module EventsManager
    class Publisher
      attr_reader :subscribers

      def initialize
        @subscribers = {}
      end

      def subscribe(event_name, handlers)
        event_handlers = @subscribers[event_name.to_sym]
        event_handlers = [] if event_handlers.nil?
        event_handlers += handlers
        @subscribers[event_name.to_sym] = event_handlers
      end

      def publish(event)
        event_name = event.name
        raise ArgumentError.new("The event #{event_name} is unknown. Try to subscribe it before.") unless @subscribers.include?(event_name.to_sym)
        handlers = @subscribers[event_name.to_sym]
        handlers.each do |handle|
          handle.notify(event)
        end
      end
    end
  end
end