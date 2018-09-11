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

  def self.scrape_movie_page( url = '/title/tt3104988')
    doc = Nokogiri::HTML(open('https://www.imdb.com' + url))
  end

  def self.scrape_review_page(url = 'title/tt3104988/criticreviews?ref_=tt_ov_rt')
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


#title: doc.css('tr .titleColumn')[1].text.strip
#url: doc.css('tr .titleColumn a').attribute('href').value
  #//fix this, only need title/1234567/
#weeks in theater: doc.css('.weeksColumn')[1].text
#total gross: doc.css('.ratingColumn .secondaryInfo')[1].text

#title? doc.css('.title_wrapper h1').text.strip
#summary: doc.css('.inline.canwrap span')[0].text.strip
#metascore: doc.css('.metacriticScore').text.strip
#rating(pg-13): doc.css('.txt-block span')[0].text.capitalize
#runtime: doc.css('.txt-block time').text
#review url: doc.css('.titleReviewBarSubItem a').attribute('href').value
        #//add after .com/title/tt1234567/

#//scrapes every other metacritic review
#review score: doc.css('.critscore')[0].text.strip
#review publication: doc.css('.review b span')[0].text
#review author: doc.css('.review span span')[0].text
    #some reviews may not have authors listed
#review summary:  doc.css('.review div')[5].text
