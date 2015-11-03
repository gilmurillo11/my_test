
Around('@selenium') do |scenario, block|
  unless ENV['local']
    thread_id = Thread.current.object_id
    caps = Sauce.driver_pool[thread_id].capabilities
    ENV['SELENIUM_OS'] = /\w+/.match(caps[:platform]).to_s
    ENV['SELENIUM_BROWSER'] = caps[:browser_name]
    ENV['SELENIUM_VERSION'] = /\d+/.match(caps[:version]).to_s
    block.call
  end
end

Before do
  Capybara.default_driver = :selenium
  Capybara.default_selector = :xpath
  Capybara.default_max_wait_time = 15

  ##########Setting flags##########
  @desktop = true unless ENV['browser'] == 'iPhone'

  ##########Deleting prior screenshots if exists##########
  Dir.glob('screenshot/*.png').each { |f| File.delete(f) } if ENV['local']

  @base_path_auth = "ask me"
  @base_path = "ask me"
  page.driver.browser.manage.window.resize_to(1280,1024) if @desktop
end

After do |scenario|
  if scenario.failed? && ENV['local'] != 'true'
    ##########Capture screenshot into screenshot folder##########
    Capybara.save_screenshot("./screenshot/#{scenario.__id__}.png")
    embed("./screenshot/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
end

