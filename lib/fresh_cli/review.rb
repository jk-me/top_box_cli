class FreshCli::Review
  attr_accessor :score, :publication, :author, :summary

  def initialize(attribute_hash)
    @score = attribute_hash[:score]
    @publication = attribute_hash[:publication]
    @author = attribute_hash[:author]
    @summary = attribute_hash[:summary]
  end

end

#movie.reviews //sends url to Review class
#Review.new_from_collection(Scraper.scrape_review_page(self.review_url))
