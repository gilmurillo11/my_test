Before do
  Capybara.default_driver = :selenium
  Capybara.default_selector = :xpath
  Capybara.default_max_wait_time = 15

  ##########Setting flags##########
  @desktop = true unless ENV['browser'] == 'iPhone'

  if ENV['local']
    ##########Deleting prior screenshots if exists##########
    Dir.glob('screenshot/*.png').each { |f| File.delete(f) }

    ####### Has to be wrapped in a local block, otherwise creates a local session
    page.driver.browser.manage.window.resize_to(1280,1024) if @desktop
  end

  @base_path_auth = "http://www.google.com"
  @base_path = "http://www.google.com"
end

After do |scenario|
  if scenario.failed? && ENV['local'] != 'true'
    ##########Capture screenshot into screenshot folder##########
    Capybara.save_screenshot("./screenshot/#{scenario.__id__}.png")
    embed("./screenshot/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
end