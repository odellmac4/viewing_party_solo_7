class UserMoviesController < ApplicationController
    
    def index
        conn = Faraday.new(
            url: "https://api.themoviedb.org",
            params: {api_key: Rails.application.credentials.tmdb[:key]}
            )
        
        top_rated_response = conn.get("/3/movie/top_rated")
        top_rated_response_data = JSON.parse(top_rated_response.body, symbolize_names: true)
        top_20_rated_movies = top_rated_response_data[:results].map{|movie| movie[:original_title]}
        
        if params[:q] = "top%20rated"
            top_20_rated_movies
        end
    end
end