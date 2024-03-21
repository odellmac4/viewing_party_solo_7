require 'rails_helper'

RSpec.describe 'User discover page', type: :feature, vcr: true do
    before(:each) do
        @user = User.create!(name: "Odell", email: "odell@dreams.com")
    end
    it 'displays button to discover top movies and field to search for movie by title' do
        visit user_discover_index_path(@user)

        expect(page).to have_button("Find Top Rated Movies")
        expect(page).to have_field(:search)
        expect(page).to have_button("Find Movies")
    end

    it 'allows users to find top rated movies' do
        visit user_discover_index_path(@user)

        click_on "Find Top Rated Movies"
        expect(current_path).to eq(user_movies_path(@user))
    end

    it 'allows users to search for movies by title' do
        visit user_discover_index_path(@user)
        
        fill_in :search, with: 'Black Panther'
        click_button 'Find Movies'
        expect(current_path).to eq(user_movies_path(@user))
    end

end