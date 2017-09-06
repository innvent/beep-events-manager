module Beep
  module EventsManager

		class Event
			attr_reader :id, :object_id, :date, :event_data, :object_domain, :object_type
			

      def initialize(id:, object_id:, date:, event_data:, object_domain:, object_type:)
        @id = id
        @object_id = object_id
        @date = date.to_datetime
        @event_data = JSON.parse(event_data)
        @object_domain = object_domain
        @object_type = object_type
      end	

		end

	end
end