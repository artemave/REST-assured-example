require 'capybara/cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.run_server = false
  config.app_host = "http://localhost:4567"
end

World(Capybara)
