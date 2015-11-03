This is a suite of tests that will regress the reformation site across multiple browsers and platforms (mac and win)including Safari, Chrome, Firefox and on a mobile device.  The automation is built on a Ruby/Rails framework using Cucumber to write test scenarios.  Selenium and Capybara are tools also used to drive and interact with site. Tests can be ran locally or via BrowserStack.com which provides a variety of browsers and platforms.  We can also run tests based on tags placed through out the test scenarios.

###Setup (Mac):
1. Intall Ruby 2.1.1
2. Install gems listed above
3. Install xcode command line tools
4. Clone git repository locally
5. Download Chromedriver and place in usr/local/bin directory
6. Setup Safari driver - http://sdet.us/getting-safari-webdriver-to-work/

###Running tests(command line):
####Locally
	1. local = true cucumber features #this will run all tests
	2. local = true cucumber features -t @regression #will run all tests tagged @regression
	3. local = true cucumber features/login.feature or local = true cucumber features -t @login # will run all tests for login

  Note: By default, tests will run on chrome but can be ran on safari, firefox, or mobile by adding the browser  	  variable to the command like so browser=safari, browser=firefox, browser=iphone	

####Sauce Labs
	1. rake sauce:featues will run tests through Sauce Labs

