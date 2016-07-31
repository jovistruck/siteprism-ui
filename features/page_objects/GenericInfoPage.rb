class GenericInfoPage < SitePrism::Page
  set_url "/{pagename}"

  #PageTitle
  element :header_text, :xpath, ".//*[@id='container']//h1"

  load_validation { has_header_text? }
end