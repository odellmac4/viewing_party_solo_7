require 'rails_helper'

RSpec.describe MoviesFacade, :vcr do
    before(:each) do

        @facade = MoviesFacade.new
        @movie = MoviesFacade.new.fetch_movie_by_id(500)
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
        movie_data = [title: "Friends", vote_average: 9.8]
        
        movie = @facade.create_movies(movie_data).first
        expect(movie).to be_a Movie
        expect(movie.title).to eq("Friends")
        expect(movie.vote_avg).to eq(9.8)
    end

    it '#fetch_movie_by_id' do
        expect(@facade.fetch_movie_by_id(500)).to be_a(Movie)
    end

    it '#movie_cast_members' do

        expect(@facade.movie_cast_members(@movie.id)).to be_an(Array)
        expect(@facade.movie_cast_members(@movie.id).count).to eq(10)
        expect(@facade.movie_cast_members(@movie.id).first).to be_a(CastMember)
    end

    it '#more_reviews' do
        review = @facade.movie_reviews(@movie.id).first

        expect(@facade.movie_reviews(@movie.id)).to be_an Array
        expect(review).to be_a Review
        expect(review.author).to be_a String
        expect(review.content).to be_a String
        
    end
end