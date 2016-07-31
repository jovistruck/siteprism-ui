require 'capybara'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'
require 'pry'
require 'phantomjs'

Phantomjs.path
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara.default_max_wait_time = 25

if ENV['IN_BROWSER']
  # On demand: non-headless tests via Selenium/WebDriver
  # To run the scenarios in browser (default: Firefox), use the following command line:
  # IN_BROWSER=true bundle exec cucumber
  # or (to have a pause of 1 second between each step):
  # IN_BROWSER=true PAUSE=1 bundle exec cucumber
  Capybara.default_driver = :selenium
  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end
  Capybara.javascript_driver = :selenium

elsif ENV['IN_BROWSER_CHROME']

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(
        app,
        :browser => :chrome,
    )
  end
  Capybara.default_driver = :selenium_chrome
  Capybara.javascript_driver = :selenium_chrome

  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end

else

  # DEFAULT: headless tests with poltergeist/PhantomJS
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      :phantomjs => Phantomjs.path,
      window_size: [1280, 1024],
      js_errors: false,
      timeout: 25
      #debug:       true
    )
  end
  #Capybara.default_driver   = :webkit
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist

end

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

Capybara.configure do |config|
  config.match = :prefer_exact
  config.save_and_open_page_path = File.dirname(__FILE__) + '/../../tmp/'
  
end
