class Movie
  attr_accessor :title, :weeks_in_theater, :total_gross, :url, :movie_page
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

  def summary
    #retrieves movie summar
    summaries = Scraper.scrape_movie_page(@url).css('.inline.canwrap span')[0].text.strip
  end

  def reviews
    #retrieves 5 critic reviews
  end

end
