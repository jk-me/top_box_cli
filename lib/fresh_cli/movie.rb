class Movie
  attr_accessor :title, :tomato_score, :audience_score, :url
  @@all=[]

  def initialize(title, tomato_score, audience_score, url)
    @title = title
    @tomato_score = tomato_score
    @audience_score = audience_score
    @url = url
    @@all << self
  end

  def all
    @@all
  end

  def summary
    #retrieves movie summary
  end

  def reviews
    #retrieves 5 critic reviews
  end

end
