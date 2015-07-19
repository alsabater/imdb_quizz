require 'sinatra'
require 'sinatra/reloader' if development?
require 'imdb'
require 'pry'

require_relative "./imdb_showing_movies.rb"

get '/' do
	if params[:go] == "Go!"
		redirect to ('/search')
	end
	erb :index	
end

get '/search' do
	@movies = ListOfMovies.new params[:movie_title]
	@movies.storing_imdb_movies
	list = @movies.storing_movies_with_posters
	@quizz = Trivia.new list
	@quizz.generate_answer
	@quizz.ask_question
	erb :imdb_movies
end

