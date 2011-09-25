require 'capybara/cucumber'
require 'rspec/expectations'
require 'rest-client'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.run_server = false
  config.app_host = "http://localhost:4579"
  config.default_wait_time = 5
end

module KnowsAboutRestAssured
  def stub_server_host
    'http://localhost:4578'
  end
end

World(Capybara, KnowsAboutRestAssured)

After do
  RestClient.delete "#{stub_server_host}/doubles/all"
end
