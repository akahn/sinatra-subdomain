require File.dirname(__FILE__) + '/../lib/sinatra/subdomain'
require 'test/unit'
require 'capybara'
require 'capybara/dsl'

class SubDomainTest < Test::Unit::TestCase
  include Capybara
  Capybara.default_driver = :selenium

  Capybara.app = Sinatra.new(Sinatra::Base) do
    subdomain :foo do
      get('/') { "foo" }
    end
    get('/') { "home" }
  end

  def test_subdomain
    visit 'http://foo.smackaho.st:9887/'
    p page.body
    assert page.has_content? 'foo'
  end

  def test_home
    visit 'http://smackaho.st:9887/'
    p page.body
    assert page.has_content? 'home'
  end
end
