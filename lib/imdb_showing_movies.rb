require 'imdb'
require 'pry'
require 'pry'

class List_of_movies

	def title_of_the_movie
		@movie_title = params[:movie_title]
	end

	def storing_imdb_movies
		@i = Imdb::Search.new(@movie_title)
		@i = @i.movies
	end

	def storing_movie_posters
	@posters = []
	count = 0
	j = 0
		while count < 9 
			if @i[j].poster != nil
			@posters.push(@i[j].poster)
			count += 1
			j+=1
			else j += 1
			end
		end
	end

end