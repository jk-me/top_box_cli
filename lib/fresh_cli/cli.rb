#cli controller
require 'pry'

class FreshCli::CLI
#Movie atts :title, :weeks_in_theater, :total_gross, :url
# :summary, :metascore, :rating, :runtime, :review_url, :reviews
  def call
    puts 'Current Top Box Office Movies by imdb.com'
    FreshCli::Movie.new_from_collection(Scraper.scrape_movie_list)
    list_movies
    # FreshCli::Movie.all.each { |movie| #runs slowly
    #   movie.get_movie_details
    #   movie.get_reviews
    # }
    menu
  end

  def list_movies
    #parse array of movie objects to output list
    FreshCli::Movie.all.each do |m|
      puts "#{m.num}. #{m.title}"
      puts "Week #{m.weeks_in_theater}, Total gross: #{m.total_gross}"
      puts '--------------'
    end
  end

  def menu
    #takes user input to provide more information
    puts "Enter number of a movie from the list to view a plot summary, 'list' to see the list of movies again or 'exit' to quit"
    x = gets.strip
    num = x.to_i
    if num > 0 and num < FreshCli::Movie.all.length + 1
      m = FreshCli::Movie.all[num-1]
      m.get_movie_details

      puts "---------"
      puts "#{m.title}, #{m.runtime}"
      puts "Metascore: #{m.metascore}"
      puts "---------"
      puts m.summary
      puts "---------"

      review_menu(m)
    elsif x=='exit'
      exit
    elsif x=='list'
      list_movies
      menu
    else
      puts "invalid entry"
      menu
    end
  end

  def review_menu(m)
    #asks if user would like to see reviewsfor specific movie
    puts "Would you like to see some Metacritic reviews from this movie? y/n"
    x=gets.strip
    if  x=='y'
      m.get_reviews
      m.reviews.each{ |review|
        puts "Score: #{review.score}"
        puts "#{review.publication}, #{review.author}"
        puts "---"
        puts review.summary
        puts "--------------"
      }
      menu
    else x=='n'
      menu
    end
  end

end
