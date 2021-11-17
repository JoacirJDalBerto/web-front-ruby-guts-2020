require 'rspec'
require 'capybara'
require 'site_prism'
require 'cucumber'
require 'selenium-webdriver'

Capybara.register_drive :site_prism do |app|
    Capybara::Selenium::Driver.new(app, browser: :remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :chrome) #Onde vai rodar a aplicação
end

Capybara.configure do |config| #Contruindo uma aplicação  não é nativa
    config.run_server = false
    Capybara.default_driver = :site_prism
    Capybara.page.driver.browser.manage.window.maximize
    config.default_max_wait_time = 10
    config.app_host = 'http://www.automationpractice.com/index.php'
end
    