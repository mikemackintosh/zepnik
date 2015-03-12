module ::PROJECTNAME::
  class Web
    module Default
      def self.registered(app)
        
        # Parent Route
        app.get  '/' do
          
          erb :index
        end

      end
    end
  end
end
