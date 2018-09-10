class Movie
  attr_accessor :title, :weeks_in_theater, :total_gross, :url, :summary, :metascore, :rating, :runtime, :review_url, :reviews
  @@all=[]

  def initialize(attribute_hash)
    @title = attribute_hash[:title]
    @weeks_in_theater = attribute_hash[:weeks_in_theater]
    @total_gross = attribute_hash[:total_gross]
    @url = attribute_hash[:url]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_collection(movie_attributes_array)
    movie_attributes_array.each{ |x| Movie.new(x) }
  end

  def get_movie_details
    movie_page = Scraper.scrape_movie_page(@url)
    @summary = movie_page.css('.inline.canwrap span')[0].text.strip
    @metascore = movie_page.css('.metacriticScore').text.strip
    @rating = movie_page.css('.txt-block span')[0].text.capitalize
    @runtime = movie_page.css('.txt-block time').text
    @review_url = movie_page.css('.titleReviewBarSubItem a').attribute('href').value
  end

  def reviews
    Review.new
  end

end
