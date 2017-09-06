require  'singleton'

module Beep
  module EventsManager

  	class Config
	  		
		 	include Singleton

		  attr_accessor :object_domain, :database_config


		  def load_configurations(data)
		  	@object_domain = data['object_domain']
		  	@database_config = data['database_config']
		  end

  	end

  end
end