class UserMoviesController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])
        @search = params[:search]
        
        if @search.present?
            @movies = MoviesFacade.new.search_movies(@search)
        elsif params[:q] = "top rated"
            @movies = MoviesFacade.new.top_rated_movies
        end
    end

    def show
        @user = User.find(params[:user_id])
        @movie = MoviesFacade.new.fetch_movie_by_id(params[:id])
    end
end