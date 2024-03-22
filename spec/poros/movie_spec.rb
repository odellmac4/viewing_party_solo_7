require 'rails_helper'

RSpec.describe Movie, :vcr do
    before(:each) do
        data = {title: "Freaky Friday", 
        vote_average: 8.9, 
        id: 678,
        overview: "King T'Challa returns home",
        genres: [{:id=>35, :name=>"Comedy"}, {:id=>28, :name=>"Action"}],
        runtime: 99
    }
        @movie = Movie.new(data)
        @movie_2 = MoviesFacade.new.fetch_movie_by_id(500)
    end
    it 'has attributes' do
        expect(@movie).to be_a Movie
        expect(@movie.title).to eq "Freaky Friday"
        expect(@movie.vote_avg).to eq 8.9
        expect(@movie.id).to eq 678
        expect(@movie.summary).to eq("King T'Challa returns home")
        expect(@movie.runtime).to eq(99)
    end

    it "#genres" do
        expect(@movie.genres).to eq(["Comedy", "Action"])
    end

    it "#cast" do
        movie = MoviesFacade.new.fetch_movie_by_id(500)
        cast_member = movie.cast.first
        expect(movie.cast).to be_a Array
        expect(movie.cast.count).to eq(10)
        expect(cast_member).to be_a CastMember
        expect(cast_member.name.class).to eq String
        expect(cast_member.character.class).to eq String
    end

    it "#reviews" do
        review = @movie_2.reviews
        
        expect(review).to be_an Array
        expect(review.first).to be_a Review
    end

    it "#review_count" do
        expect(@movie_2.review_count).to be_an Integer
    end
end