#Capabilities for local browsers
@chrome_caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {:args => ["test-type" ]})

@safari_caps = Selenium::WebDriver::Remote::Capabilities.safari('ensureCleanSession' => true)

