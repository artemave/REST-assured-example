require 'capybara/cucumber'
require 'rspec'
require 'rest-client'
require 'rest-assured'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.run_server = false
  config.app_host = "http://localhost:4567"
end

World(Capybara)

RestAssured::Server.start(database: ':memory:')

After do
  RestClient.delete "#{RestAssured::Server.address}/doubles/all"
end
