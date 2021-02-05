class Movie
  
#Class variables
	@@viewed = []
	@@my_watchlist = []
	
#Attr Reader Variables
	attr_reader :imdb_ranking, :index, :title, :director, :year, :rating, :duration, :genres #Reader methods that scrape basic details from IMDb Index Page
	
	attr_reader :actors, :characters, :cast, :tagline, :plot, :trivia, :quotes #Reader methods that scrape in-depth details from movie's own IMDb page

#Initialization method
	def initialize (imdb_ranking = nil) #initializes movie with basic details from IMDb Index Page
		if imdb_ranking == nil 
		  user_input
		else
		  @imdb_ranking = imdb_ranking
		end
		@title = title
		@director = director
		@year = year
		@rating = rating
		@duration = duration
		@genres = genres
		save
		self
	end 
	
#Initialization supporting methods 
	def input_requirement(user_input)
		if user_input >= 1 && user_input <= 100
			true
		else
			false
		end
	end
  
	def user_input
      puts "Please enter a movie ranked between 1-100"
      user_input = (gets.strip).to_i
      if input_requirement(user_input) == true
        @imdb_ranking = user_input
      else
        while input_requirement(user_input) != true
          puts "Invalid user selection. Please enter a index between 1-100."
          user_input = (gets.strip).to_i
        end
		@imdb_ranking = user_input
      end
      @imdb_ranking
	end
	
#Basic movie details scraped from summary IMDb Index Page
	def index
	  @imdb_ranking.to_i - 1
	end 
	
	def index_page
	  Scraper.index_page
	 end
	
	def title
		index_page.css("h3.lister-item-header a")[index].text.strip
	end
	
	def director
	  index_page.css("p + p.text-muted.text-small > a:first-child")[index].text.strip
	end
	
	def year
	  index_page.css("h3.lister-item-header span.lister-item-year.text-muted.unbold")[index].text.strip.gsub("(","").gsub(")","")
	end
	
	def rating
	  index_page.css("span.certificate")[index].text.strip
	end
	
	def duration
	  index_page.css("span.runtime")[index].text.strip
	end

	def genres
	  index_page.css("span.genre")[index].text.strip
	end
	
	def print_basic_details #Prints all the basic details scraped for the user to see
	  puts "IMDb Top 100 Ranking: #{imdb_ranking}\nMovie title: #{title}\nDirected by: #{director}\nReleased in: #{year}\nGenre(s): #{genres}\nRated: #{rating}\nRuntime: #{duration}"
	end
	
#More in-depth movie details scraped from movie's individual IMDb page
	def movie_page
	  Scraper.new.movie_page(self)
	end
	
	def trivia_page
	  Scraper.new.trivia_page(self)
	end
  
	
	def quotes_page
	  Scraper.new.quotes_page(self)
	end
	
	def ask_user
	   puts "Enter (1) if you'd like to know #{title}'s tagline.\nEnter (2) if you'd like to know #{title}'s plot.\nEnter (3) if you'd like to know interesting trivia about #{title}.\nEnter (4) if you'd like to hear some of the most famous quotes from #{title}.\nEnter (5) if you'd like to know #{title}'s cast and crew."
	 end
	
	def tagline
	   movie_page.css("div.txt-block")[0].text.split("\n")[2].to_s.strip
	end
	
	def print_tagline
	  puts "\nTagline: #{tagline}"
	end
	
	def plot
	  unedited_plot = movie_page.css(".inline.canwrap").text.strip
	  plot = unedited_plot.slice(0, unedited_plot.index("Written by")).strip
	end
	
	def print_plot
	  puts "\nPlot: #{plot}"
	end

	def trivia
	  trivia = []
	  trivia_array = trivia_page.css("div.sodatext")
	  i = 1
	  trivia_array.collect{|trivium| 
	    trivia << "\nFun Fact ##{i}: #{ActionView::Base.full_sanitizer.sanitize(trivium.to_s.strip)}"
	    i+=1
	  }
	  trivia
	end
	
	def more_fun_facts
	  	puts "\nWould you like to see fifty more fun facts about #{title}?"
	    puts "Enter 'y' for yes and 'n' for no."
	    user_input = gets.strip
	end  
	
	def print_trivia
		puts "\nHere are fifty fun facts about #{title}:"
		i = 1
		user_input = 'y'
		
		while i <= 300 && user_input == 'y'
		  
		  while i <= 50
		    puts "\n"
		    puts trivia[0..49]
		    i+=50
		    if trivia[0..49].count == 50
		      user_input = more_fun_facts
		    else
		      user_input == 'n'
		    end
		  end
		  
	    while i >50 && i <=100 && user_input == 'y'
	    	puts "\n"
		    puts trivia[50..99]
		    i+=50
		    if trivia[50..99].count == 50
		      user_input = more_fun_facts
		    else
		      user_input == 'n'
		    end
	    end
	    
	    while i > 100 && i <= 150 && user_input == 'y'
		    puts "\n"
		    puts trivia[100..149]
		    i+=50
		    if trivia[100..149].count == 50
		      user_input = more_fun_facts
		    else
		      user_input == 'n'
		    end
	    end
	
	    while i > 150 && i <= 200 && user_input == 'y'
	 		  puts "\n"
	 		  puts trivia[150..199]
	 		  i+=50
	 		  if trivia[150..199].count == 50
		      user_input = more_fun_facts
		    else
		      user_input == 'n'
		    end
	    end
	    
	    while i > 200 && i <= 250 && user_input == 'y'
		    puts "\n"
		    puts trivia[200..249]
		    i+=50
		    if trivia[200..249].count == 50
		      user_input = more_fun_facts
		    else
		      user_input == 'n'
		    end
	    end
	    
	    while i > 250 && i <= 300 && user_input == 'y'
		    puts "\n"
		    puts trivia[250..299]
		    i+=50
	    end
	 end
	end
	
	def quotes
	  quotes = []
	  quotes_array = quotes_page.css("div.sodatext")
	  i = 1
	  quotes_array.collect{|quote| 
	    quotes << "\nQuote ##{i}: #{ActionView::Base.full_sanitizer.sanitize(quote.to_s.strip)}"
	    i+=1
	  }
	  quotes
	end
	
	def more_quotes
	  	puts "\nWould you like to see fifty more memorable quotes from #{title}?"
	    puts "Enter 'y' for yes and 'n' for no."
	    user_input = gets.strip
	end  
	
	
	def print_quotes
		puts "Here are some of #{title}'s most memorable quotes:"
		i = 1
		user_input = 'y'
		
		while i <= 300 && user_input == 'y'
		  
		  while i <= 50
		    puts "\n"
		    puts quotes[0..49]
		    i+=50
		    if quotes[0..49].count == 50
		      user_input = more_quotes
		    else
		      user_input = 'n'
		    end
		  end
		  
	    while i >50 && i <=100 && user_input == 'y'
	    	puts "\n"
		    puts quotes[50..99]
		    i+=50
		    if quotes[50..99].count == 50
		      user_input = more_quotes
		    else
		      user_input = 'n'
		    end
	    end
	    
	    while i > 100 && i <= 150 && user_input == 'y'
		    puts "\n"
		    puts quotes[100..149]
		    i+=50
		    if quotes[100..149].count == 50
		      user_input = more_quotes
		    else
		      user_input = 'n'
		    end
	    end
	
	    while i > 150 && i <= 200 && user_input == 'y'
	 		  puts "\n"
	 		  puts quotes[150..199]
	 		  i+=50
	 		  if quotes[150..199].count == 50
		      user_input = more_quotes
		    else
		      user_input = 'n'
		    end
	    end
	    
	    while i > 200 && i <= 250 && user_input == 'y'
		    puts "\n"
		    puts quotes[200..249]
		    i+=50
		    if quotes[200..249].count == 50
		      user_input = more_quotes
		    else
		      user_input = 'n'
		    end
	    end
	    
	    while i > 250 && i <= 300 && user_input == 'y'
		    puts "\n"
		    puts quotes[250..299]
		    i+=50
	    end
	 end
	end
	
	def actors
	  actors = []
	  cast_array = movie_page.css("table.cast_list td.primary_photo + td a")
	  cast_array.collect{|actor| actors << actor.text.strip}
	  actors
	end
	
	def characters
	  characters = []
	  movie_page.css("table.cast_list .character a").collect{|character| characters << character.text.strip}
	  characters
	end
	
	def cast
	  cast_array = []
	  i = 0 
	  while i < actors.count
	    actor_role = actors[i].to_s + " - " + characters[i].to_s
	    cast_array << actor_role
	    i+=1
	  end
	  cast_array
	end
	
	def print_cast
	  puts "\nThe movie's cast consists of #{cast}"
	end
	
	def advanced_details
	  @tagline = tagline
	  @plot = plot
	  @trivia = trivia
	  @quotes = quotes
	  self
	end
	
	def print_advanced_details #Prints all the advanced details scraped for the user to see
	  advanced_details
	  puts "\nTagline: #{tagline}\nPlot: #{plot}\nTrivia: #{trivia}\nQuotes: #{quotes}"
	end
	
#Methods that show or save movies to the @@viewed class variable
  	
	def self.viewed
		@@viewed
	end
	
	def save
	  if self.class.viewed.find {|saved_movie| saved_movie.imdb_ranking == self.imdb_ranking} != nil
	   self
	 else
	   self.class.viewed << self
	   self
	 end
	end
	
#Methods that show or save movies to the @@vmy_watchlist class variable

	def self.my_watchlist
		@@my_watchlist
	end
	
	def add_to_my_watchlist
	 if self.class.my_watchlist.find {|watchlisted_movie| watchlisted_movie.imdb_ranking == self.imdb_ranking} != nil
	   puts "Already added to my watchlist. No duplicates allowed."
	   self
	 else
	   puts "Added to my watchlist successfully."
	   self.class.my_watchlist << self
	   self
	 end
	end 
	
	def self.print_my_watchlist
		puts "Here's your current watchlist: "
		movie_titles = []
		i = 1
		self.my_watchlist.each{|movie| 
		movie_titles << "#{i}. #{movie.title}"
		i += 1
		}
		puts movie_titles
	end
end
binding.pry


