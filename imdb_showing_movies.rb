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
	# @movies_with_posters =  @i[0...15].select{|m| m.poster != nil}
	count = 0
	j = 0
		while count < 9 && @i[j] != nil
			if @i[j].poster != nil 
				@movies_with_posters.push(@i[j])
				count+=1
				j+=1
			else 
				j+=1
			end
		end
		return @movies_with_posters
	end
end
class Trivia 
	attr_accessor :question, :year_solution, :question_1, :question_2, :director_solution

	def initialize movie
		@movie = movie
	end

	def generate_answer
		@year_solution = @movie[rand(9)].year
		@director_solution = @movie[rand(9)].director
	end

	def ask_question
		@question_1 = "Which movie was released in " + @year_solution.to_s + " ?"
		@question_2 = "Which movie has been directed by " + @director_solution.to_s + " ?"
	end

end