require "sauce"
require "sauce/cucumber"
require "capybara"
require "sauce/capybara"
require_relative "sauce_driver"

Sauce.config  do |config|
  config[:browsers] = [
      ["OS X 10.10","chrome","41"]
      # ["Windows 10","chrome","41"],
      # ["OS X 10.10","safari","8.0"]
      # ["OS X 10.9","safari","7.0"],
      # ["OS X 10.10","firefox","40"],
      # ["Windows 10","firefox","40"]
  ]

  config['prerun'] = {
    :executable =>'https://gist.githubusercontent.com/saucyallison/3a73a4e0736e556c990d/raw/d26b0195d48b404628fc12342cb97f1fc5ff58ec/disable_fraud.sh',
    :background => 'false'
  }

  config.whitelist :screenResolution
  config[:screenResolution] = "1280x1024"
  config[:start_tunnel] = false
  config.whitelist :autoAcceptAlerts
  config[:autoAcceptAlerts] = true
  config.whitelist :recordVideo
  config[:recordVideo] = true
  config.whitelist :recordScreenshots
  config[:recordScreenshots] = true
  config.whitelist :acceptSslCerts
  config[:acceptSslCerts] = "true"
  config.whitelist :avoidProxy
  config[:avoidProxy] = "true"
  config.whitelist :seleniumVersion
  config[:seleniumVersion] =  "2.47.1"

end



