require 'selenium/webdriver'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'minitest'

if ENV['local']
  Capybara.register_driver :selenium do |app|
    case ENV['browser']
      when 'firefox' then Capybara::Selenium::Driver.new(app, browser: :firefox)
      when 'safari'  then Capybara::Selenium::Driver.new(app, browser: :safari, :desired_capabilities => @safari_caps)
      # when 'iPhone'  then Capybara::Selenium::Driver.new(app, browser: :chrome, :desired_capabilities => @chrome_caps)
      else Capybara::Selenium::Driver.new(app, browser: :chrome, :desired_capabilities => @chrome_caps)
    end
  end
  Capybara.javascript_driver = :selenium

else

  require "sauce"
  require "sauce/cucumber"
  require "capybara"
  require "sauce/capybara"

  Capybara.default_driver = :sauce

end



