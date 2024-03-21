require 'rails_helper'

RSpec.describe MoviesService, :vcr do
    describe "#movies" do
        it 'returns top rated movies' do
            top_movies = MoviesService.new.top_rated_movies
            expect(top_movies).to be_a Hash
            expect(top_movies[:results]).to be_an Array

            top_movies_data = top_movies[:results].first
            expect(top_movies_data).to have_key :original_title
            expect(top_movies_data[:original_title]).to be_a(String)
            expect(top_movies_data[:vote_average]).to be_a(Float)
        end

        it 'returns searched movies' do
            searched_movies = MoviesService.new.search_movies("Black Panther")
            expect(searched_movies).to be_a Hash
            expect(searched_movies[:results]).to be_an Array

            searched_movies_data = searched_movies[:results].first
            expect(searched_movies_data).to have_key :original_title
            expect(searched_movies_data[:original_title]).to be_a(String)
            expect(searched_movies_data[:vote_average]).to be_a(Float)
        end
    end
end