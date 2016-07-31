require 'capybara'

case ENV['TARGET']
  when 'valtech-live' then
    Capybara.app_host = 'http://www.valtech.com/'
    puts "\n>>>> ENVIRONMENT = VALTECH <<<<\n\n"
end