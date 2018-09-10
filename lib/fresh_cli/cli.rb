#cli controller
require 'pry'
require_relative './scraper'
require_relative './movie'
class FreshCli::CLI

  def call
    puts 'Current Top Box Office Movies certified fresh by RottenTomatoes.com'
    list_movies
    #menu
  end

  def list_movies
    #parse array of movie objects to output list
    #puts "1. Crazy Rich Asians, Tomatometr: 94%, Audience Score: 87%"
    Movie.new_from_collection(Scraper.scrape_movie_list)
    binding.pry

    #etc.
  end

  def menu
    #takes user input to provide more information
    puts "Enter number of a movie on the list to view a plot summary, or 'exit' to quit"
    x=gets.strip
    if x=='1'
      puts 'crazy rich asians summary'
      review_menu#(movie)
    elsif x=='exit'
      exit
    else
      puts "invalid entry, enter another number or 'exit' to quit"
      list_movies
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
