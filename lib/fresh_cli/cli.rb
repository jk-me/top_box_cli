#cli controller
require 'pry'

class FreshCli::CLI
#Movie atts :title, :weeks_in_theater, :total_gross, :url
# :summary, :metascore, :rating, :runtime, :review_url, :reviews
  def call
    puts 'Current Top Box Office Movies by imdb.com'
    list_movies
    menu
  end

  def list_movies
    #parse array of movie objects to output list
    FreshCli::Movie.new_from_collection(Scraper.scrape_movie_list)
    FreshCli::Movie.all.each do |m|
      puts "#{m.num}. #{m.title}"
      puts "Week #{m.weeks_in_theater}, Total gross: #{m.total_gross}"
      puts '--------------'
      m.get_movie_details
      m.get_reviews
      puts m.reviews[0].author
    end
  end

  def menu
    #takes user input to provide more information
    puts "Enter number of a movie on the list to view a plot summary, or 'exit' to quit"
    x = gets.strip
    num = x.to_i
    if num > 0 and num < Movie.all.length + 1
      puts Movie.all[num-1].title
      #review_menu#(movie)
    elsif x=='exit'
      exit
    else
      puts "invalid entry"
      #list_movies
      menu
    end
  end

  def review_menu#(movie)
    #asks if user would like to see reviewsfor specific movie
    puts "Would you like to see some critic reviews from this movie? y/n"
    x=gets.strip
    if  x=='y'
      puts "5 reviews"
    else x=='n'
      menu
    end
  end

end
