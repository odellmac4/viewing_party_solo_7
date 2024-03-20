class UserMoviesController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])

        conn = Faraday.new(
            url: "https://api.themoviedb.org",
            params: {api_key: Rails.application.credentials.tmdb[:key]}
            )
            # require'pry';binding.pry
        

        
        
        if params[:search].present?
            search_response = conn.get("/3/search/movie?query=#{params[:search]}")
            search_response_data = JSON.parse(search_response.body, symbolize_names: true)
            @movies = search_response_data[:results] 
        elsif params[:q] = "top rated"
            top_rated_response = conn.get("/3/movie/top_rated")
            top_rated_response_data = JSON.parse(top_rated_response.body, symbolize_names: true)
            @movies = top_rated_response_data[:results]
        end
    end
end