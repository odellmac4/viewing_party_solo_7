require 'rails_helper'

RSpec.describe Movie do
    it 'has attributes' do
        data = {original_title: "Freaky Friday", vote_average: 8.9}
        movie = Movie.new(data)

        expect(movie).to be_a Movie
        expect(movie.title).to eq "Freaky Friday"
        expect(movie.vote_avg).to eq 8.9
    end
end