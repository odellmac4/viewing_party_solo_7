class UserMoviesController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])
        
        if params[:search].present?
            @movies = MoviesFacade.new.search_movies(params[:search])
        elsif params[:q] = "top rated"
            @movies = MoviesFacade.new.top_rated_movies
        end
    end
end