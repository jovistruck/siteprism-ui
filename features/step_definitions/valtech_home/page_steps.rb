Then(/^the valtech news section is displayed$/) do
  expect($app.valtech_home).to have_latest_news_header
  expect($app.valtech_home).to have_latest_news_blogposts
  expect($app.valtech_home).to have_all_news_linkbutton
end

Then(/^the title header of the page is "([^"]*)"$/) do |expected_page_header|
  expect($app.generic_info_page.header_text.text.upcase).to eq expected_page_header
end

Then(/^the number of contact locations listed is "([^"]*)"$/) do |expected_number_of_locations|
  expect($app.valtech_home.contact_locations.size).to eq expected_number_of_locations.to_i
end