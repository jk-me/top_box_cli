require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def self.scrape_movie_list
    doc = Nokogiri::HTML(open('https://www.imdb.com/chart/boxoffice/'))
    titles = doc.css('tr .titleColumn').collect{|x| x.text.strip}
    urls = doc.css('tr .titleColumn a').collect{|x| x.attribute('href').value[0,16]} #/title/tt3104988
    weeks_in_theater = doc.css('.weeksColumn').collect{|x| x.text}
    total_gross = doc.css('.ratingColumn .secondaryInfo').collect{|x| x.text}

    movies_attributes=[]
    i=0
    while i<titles.length
      att_hash={}
      att_hash[:url] = urls[i]
      att_hash[:title] = titles[i]
      att_hash[:weeks_in_theater] = weeks_in_theater[i]
      att_hash[:total_gross] = total_gross[i]
      movies_attributes << att_hash
      i+=1
    end
    movies_attributes
  end

  def self.scrape_movie_page( url ) #'/title/tt3104988'
    doc = Nokogiri::HTML(open('https://www.imdb.com' + url))
  end

  def self.scrape_review_page( url ) #'/title/tt3104988/criticreviews?ref_=tt_ov_rt'
    doc = Nokogiri::HTML(open('https://www.imdb.com/' + url))
    scores = doc.css('.critscore').collect{|y| y.text.strip}
    publications = doc.css('.review b span').collect{|y| y.text}
    authors = doc.css('.review span span').collect{|y| y.text}
      #some_reviews may not have authors listed
    summarys = doc.css('.review div').collect{|y| y.text.strip}

    review_attributes=[]
    i=0
    while i < scores.length
      att_hash={}
      att_hash[:score] = scores[i]
      att_hash[:publication] = publications[i]
      att_hash[:author] = authors[i]
      att_hash[:summary] = summarys[i]
      review_attributes << att_hash
      i+=1
    end
    review_attributes
  end

end
