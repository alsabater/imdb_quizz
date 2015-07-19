require 'imdb'
require 'pry'

class ListOfMovies
	attr_accessor :movies_with_posters, :i

	def initialize title
		@movie_title = title
	end

	def storing_imdb_movies
		@i = Imdb::Search.new(@movie_title)
		@i = @i.movies
	end

	def storing_movies_with_posters
	@movies_with_posters = []
	@movies_with_posters =  @i[0..9].select{|m| m.poster}
		binding.pry

	# count = 0
	# j = 0
	# 	while count < 9 
	# 		if @i[j].poster != nil 
	# 			@movies_with_posters.push(@i[j])
	# 			count+=1
	# 			j+=1
	# 		else 
	# 			j+=1
	# 		end
	# 	end
	# 	return @movies_with_posters
	end
end
class Trivia 
	attr_accessor :question, :year_solution

	def initialize movie
		@movie = movie
	end

	def generate_answer
		@year_solution = @movie[rand(9)].year
	end

	def ask_question
		@question = "Which movie was released in " + @year_solution.to_s + " ?" 
	end

end