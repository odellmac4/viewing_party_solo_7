require 'rails_helper'

RSpec.describe MoviesFacade, :vcr do
    before(:each) do

        @facade = MoviesFacade.new
    end

    it 'exists' do
        expect(@facade).to be_a(MoviesFacade)
    end

    it '#top_rated_movies' do
        VCR.use_cassette("Movie_results_page") do
        expect(@facade.top_rated_movies).to be_an Array
        end
    end
    
    it '#search_movies' do
        expect(@facade.search_movies("Black Panther")).to be_an Array
    end
    
    it '#create_movies' do
        movie_data = [original_title: "Friends", vote_average: 9.8]
        movie = @facade.create_movies(movie_data).first
        expect(movie).to be_a Movie
        expect(movie.title).to eq("Friends")
        expect(movie.vote_avg).to eq(9.8)
    end

    it '#fetch_movie_by_id' do
        expect(@facade.fetch_movie_by_id(500)).to be_a(Movie)
    end
end