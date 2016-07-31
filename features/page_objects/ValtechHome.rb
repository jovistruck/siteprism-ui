class ValtechHome < SitePrism::Page
  set_url "/"

  #RightNavigationLinks
  element :right_panel_open_link, :css, ".hamburger__front"
  elements :right_panel_links, :xpath, "//*[@id='navigationMenuWrapper']//a"

  #ContactIcon
  element :contact_icon, :xpath, ".//*[@id='contacticon']"
  elements :contact_locations, :css, ".contactcities>li>a"

  #NewsSections
  element :latest_news_header, :css, "div.news-post__listing-header"
  element :latest_news_blogposts, :css, "div.bloglisting.news-post__listing"
  element :all_news_linkbutton, :css, ".news-item__listing-link.button>a"

  load_validation { has_latest_news_header? }
end