Given(/^I am on the valtech home page$/) do
  $app = App.new
  $app.valtech_home.load
end

And(/^I click and open the right navigation panel$/) do
  $app.valtech_home.right_panel_open_link.click
  sleep 2
end

And(/^I visit the "([^"]*)" page from the right navigational links$/) do |link_name|
  $app.valtech_home.right_panel_links[get_element_index_for_link(link_name)].click
end

When(/^I visit the contact page$/) do
  $app.valtech_home.contact_icon.click
end

def get_element_index_for_link(link_name)
  $app.valtech_home.right_panel_links.find_index { |element| element.text == link_name }
end