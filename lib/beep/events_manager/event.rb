require 'active_record'

module Beep
  module EventsManager

    class Event < ActiveRecord::Base

      def to_hash
        {
          id: self.id,
          date: self.date,
          object_id: self.object_id,
          object_type: self.object_type,
          object_domain: self.object_domain,
          event_data: self.event_data,
          event_name: self.event_name
        }
      end
    end

	end
end
