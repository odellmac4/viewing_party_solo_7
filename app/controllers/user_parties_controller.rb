class UserPartiesController < ApplicationController
    def new
        @movie = MoviesFacade.new.fetch_movie_by_id(params[:movie_id])
        @users = User.all
    end

    def create

    end
end