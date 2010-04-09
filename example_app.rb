require 'sinatra'
require 'sinatra/subdomain'

# This is an example application that uses sinatra-subdomain. Start it using 
# `shotgun -I lib example_app.rb`. Then visit http://smackaho.st:9393 and
# http://foo.smackaho.st:9393 to use the application.

subdomain :foo do |sub|
  get '/' do
    "You are on: #{sub}"
  end

end

get '/' do
  "Home!"
end
