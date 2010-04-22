require 'sinatra/base'
require 'sinatra/subdomain'

# This is an example of a classic application that uses sinatra-subdomain.
# You'll need a config.ru as follows:
# require 'example_modular_app' 
# run Hello
# Start it using `shotgun -I lib example_modular_app.rb`. Then visit http://smackaho.st:9393 and
# http://foo.smackaho.st:9393 to use the application.

class Hello < Sinatra::Base
  register Sinatra::Subdomain

  subdomain :foo do |sub|
    get '/' do
      "You are on: #{sub}"
    end
  end

  get '/' do
    "Home!"
  end
end