require 'capybara/cucumber'
require 'rspec'
require 'rest-client'
require 'rest-assured'

ENV['TWITTER_HOST'] = 'http://localhost:4578'
require_relative '../../tweet_checker'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app = Sinatra::Application.new
end

World(Capybara)

RestAssured::Server.start(database: ':memory:')

After do
  RestClient.delete "#{RestAssured::Server.address}/doubles/all"
end
