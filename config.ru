require "./app"

run Rack::URLMap.new(
  #'/api' => ::PROJECTNAME::::Api,
  '/' => ::PROJECTNAME::::Web
)