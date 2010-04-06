require 'sinatra'

module Sinatra
  module Subdomain
    def subdomain(host, &block)
      subdomain = host.to_s
      condition { subdomain == request.env['HTTP_HOST'].split('.').first }
      block.call(subdomain)
    end
  end

  register Subdomain
end
