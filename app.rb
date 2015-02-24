require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require 'sinatra/config_file'

require 'json'
require 'will_paginate'
require 'will_paginate-bootstrap'
#require 'sinatra/activerecord'
#require 'will_paginate/active_record'
 
require_relative './helpers/init'
require_relative './models/init'

module ::PROJECTNAME::

  class Base < Sinatra::Base
   
    # Load SinatraConfigFile
    register Sinatra::ConfigFile
    register Sinatra::Flash

    enable :logging
    enable :method_override

    set :environments, %w{development test production}
    set :root, File.dirname(__FILE__)

    # Add Helpers
    helpers do
      include ::PROJECTNAME::::Helpers
    end

    
    # Read the Application Configs
    config_file = ENV['::UPPERNAME::_CONFIG'] || File.join(File.dirname(__FILE__), 'config', 'application.yaml')
    if File.exist?(config_file)
      set :config, YAML::load(File.open(config_file))[::PROJECTNAME::::Base.environment.to_s]
    end
    
    
    # Make sure the config exists
    db_config_file = ENV['::UPPERPROJECTNAME::_DATABASE_CONFIG'] || File.join(File.dirname(__FILE__), 'config', 'databases.yaml')
    if File.exist?(db_config_file)
      db_config = YAML::load(File.open(db_config_file))[::PROJECTNAME::::Base.environment.to_s]
      # Create the database connection
      ActiveRecord::Base.establish_connection(db_config)
      set :config, YAML::load(File.open(config_file))[::PROJECTNAME::::Base.environment.to_s]
    end

    configure :development do
      before '/*' do
        puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S.%L")} #{request.env['REQUEST_METHOD']} #{request.env['REQUEST_URI']}  #{request.env['HTTP_USER_AGENT']}  #{request.env['CONTENT_LENGTH']} "
      end
    end

  end

  class Web < Base
    
    require_relative './routes/web/init'

    register WillPaginate::Sinatra
    #require_relative './lib/api/routes/init'
    
    use Rack::Session::Cookie, :key => '::PROJECTNAME::.session',
                           :path => '/',
                           :expire_after => 3600,
                           :secret => 'CHANGE ME!!'

    register ::PROJECTNAME::::Web::Routing

  end

  require_relative './routes/worker/init'
  
end
