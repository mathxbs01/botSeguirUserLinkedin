require "capybara"
require "capybara/cucumber"
require "allure-cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = "https://www.linkedin.com/login/pt"
    config.default_max_wait_time = 5
end


AllureCucumber.configure do |config|
    config.results_directory = "/logs"
    config.clean_results_directory = true
end