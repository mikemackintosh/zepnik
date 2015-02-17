module ::PROJECTNAME::
  class Worker < ::PROJECTNAME::::Base
    
    def initialize
      
      # Set
      @env = ENV['ROCK_ENV'] ||= 'development'

      self
    end

  end
end