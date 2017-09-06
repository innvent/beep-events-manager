require 'pg'
module Beep
  module EventsManager
    class EventRepository

      def initialize
        @conn = PG.connect( dbname: 'beep_events' )
      end
      
      def save(object_id:, event_data:, object_domain:, object_type:)
        
        saved = false
        
        sql = "INSERT INTO EVENTS (object_id, date, event_data, object_domain, object_type) VALUES (#{object_id}, now(), '#{event_data.to_json}', '#{object_domain}', '#{object_type}')"
        begin
          @conn.exec(sql)   
          saved = true
        rescue Exception => e
          puts e
          saved = false
        end
        

        saved
        
      end

      def get_by_object_id id
        events = []
        sql = "SELECT * FROM events WHERE object_id = #{id}"
        @conn.exec(sql) do |result|              
          result.each do |row|                
            event = ::Beep::EventsManager::Event.new(id: row['id'], 
                                                    object_id: row['object_id'], 
                                                    date: row['date'], 
                                                    event_data: row['event_data'], 
                                                    object_domain: row['object_domain'], 
                                                    object_type: row['object_type'])
            events << event            
          end
        end

        events
      end

    end
  end
end

