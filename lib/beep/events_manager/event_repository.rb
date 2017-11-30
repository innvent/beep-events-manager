
module Beep
  module EventsManager
    class EventRepository

      def initialize
        @db = DbManager.instance
      end

      def create(object_id:, event_name:, event_data:, object_domain:, object_type:)
        sql    = "INSERT INTO EVENTS (object_id, date, event_name, event_data, object_domain, object_type) VALUES ($1, now(), $2, $3, $4, $5)"
        result = @db.execute(sql, [object_id, event_name, event_data.to_json, object_domain, object_type] )

        result
      end

      def get_by_object_id id, object_type, object_domain
        events = []
        sql = "SELECT * FROM events WHERE object_id = #{id} and object_type = '#{object_type}' and object_domain = '#{object_domain}' order by date asc"

        rows = @db.execute(sql)
        rows.each do |row|
          event = ::Beep::EventsManager::Event.new(id: row['id'],
                                                   object_id: row['object_id'],
                                                   date: row['date'],
                                                   event_name: row['event_name'],
                                                   event_data: row['event_data'],
                                                   object_domain: row['object_domain'],
                                                   object_type: row['object_type'])
          events << event
        end

        events

      end

    end
  end
end

