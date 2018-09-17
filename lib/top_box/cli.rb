class TopBox::CLI

  def call
    puts 'Current Top Box Office Movies by imdb.com'
    TopBox::Movie.new_from_collection(Scraper.scrape_movie_list)
    list_movies
    menu
  end

  def list_movies
    #parse array of movie objects to output list
    TopBox::Movie.all.each do |m|
      puts "#{m.num}. #{m.title}"
      puts "Week #{m.weeks_in_theater}, Total gross: #{m.total_gross}"
      puts '--------------'
    end
  end

  def menu
    #takes user input to provide more information
    puts "Enter number of a movie from the list to view a plot summary, 'list' to see the list of movies again or 'exit' to quit"
    x = gets.strip.downcase
    num = x.to_i
    if num > 0 and num < TopBox::Movie.all.length + 1
      m = TopBox::Movie.all[num-1]
      if !m.summary
        m.get_movie_details
      end

      puts "---------"
      puts "#{m.title}, #{m.runtime}"
      puts "Metascore: #{m.metascore}/100"
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
    #asks if user would like to see reviews for specific movie
    puts "Would you like to see some critic reviews from this movie? y/n"
    x=gets.strip.downcase
    if  x=='y'
      m.get_reviews
      puts "--------------"
      m.reviews.each{ |review|
        puts "Score: #{review.score}/100"
        if review.author==''
          puts "From: #{review.publication}"
        else
          puts "From: #{review.publication}, by #{review.author}"
        end
        puts review.summary
        puts "--------------"
      }
      menu
    else x=='n'
      menu
    end
  end

end
