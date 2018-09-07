require 'nokogiri'
require 'open-uri'

class Scraper
  def scrape_page
     doc = Nokogiri::HTML(open(https://www.rottentomatoes.com/browse/cf-in-theaters/))
  end

end
