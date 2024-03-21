require 'rails_helper'

RSpec.describe "Movie show page", :vcr do
    describe "User story 3" do
        before(:each) do
            @user = User.create!(name: "Odell", email: "odell@dreams.com")
            @movie = MoviesFacade.new.top_rated_movies.first

            visit user_movie_path(@user, @movie.id)
        end
        it 'displays buttons create view party and return to discover page' do
            expect(page).to have_content ("#{@movie.title}")
            expect(page).to have_button "Discover Page"
        end
    end
end