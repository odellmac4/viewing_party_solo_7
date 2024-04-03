require 'rails_helper'

RSpec.describe 'Movie results page', :vcr do
    before(:each) do
        @user = User.create!(name: "Odell", email: "odell@dreams.com", password: "odell2")

    end
    it 'displays top rated movies' do
        visit user_movies_path(@user, q: "top rated")

        expect(page).to have_css(".movie", count: 20)

        within(first(".movie")) do
            # Title (As a Link to the Movie Details page (see story #3))
            expect(page).to have_css(".title a")
            # Vote Average of the movie
            expect(page).to have_css(".vote_avg") 
        end

        expect(page).to have_button("Discover Page")
        click_on "Discover Page"
        expect(current_path).to eq(user_discover_index_path(@user))
    end

    it 'displays searched movies' do
        visit user_movies_path(@user, search: "Black Panther")

        expect(page).to have_content("Black Panther: Wakanda Forever")
        expect(page).to have_css(".movie", count: 20)

        within(first(".movie")) do
            # Title (As a Link to the Movie Details page (see story #3))
            expect(page).to have_css(".title a")
            # Vote Average of the movie
            expect(page).to have_css(".vote_avg")
        end

        expect(page).to have_button("Discover Page")
        click_on "Discover Page"
        expect(current_path).to eq(user_discover_index_path(@user))
    end
end