require 'rails_helper'

RSpec.describe "Movie show page", :vcr do
    describe "User story 3" do
        before(:each) do
            @user = User.create!(name: "Odell", email: "odell@dreams.com")
            @movie = MoviesFacade.new.fetch_movie_by_id(500)

            visit user_movie_path(@user, @movie.id)
        end
        it 'displays headers' do
            within(".headers") do
                expect(page).to have_content ("Reservoir Dogs")
                expect(page).to have_content ("Viewing Party")
            end
        end
        it 'displays movie specs' do
            within(".movie_specs") do
                expect(page).to have_content ("Vote: #{@movie.vote_avg}")
                expect(page).to have_content ("Runtime: 1 hour 39 minutes")
                expect(page).to have_content ("Genre: Crime and Thriller")
            end
        end

        it 'displays movie summary' do
            within(".summary") do
                expect(page).to have_content("Summary")
                expect(page).to have_content(@movie.summary)
            end
        end

        it 'displays top 10 cast members name and character' do
            expect(page).to have_css(".cast", count: 10)

            within(".cast") do
                expect(page).to have_css(".member_name")
                expect(page).to have_css(".character")
            end
        end

        it 'displays movie review information' do
            within(".reviews") do
                expect(page).to have_css(".review_count")
                expect(page).to have_css(".review_author")
                expect(page).to have_css(".review_content")
            end
        end

        it 'displays discover page button' do
            expect(page).to have_button "Discover Page"

            click_on "Discover Page"
            expect(current_path).to eq(user_discover_index_path(@user))
        end

        it 'displays button to create a viewing party' do
            expect(page).to have_button "Create Viewing Party for Reservoir Dogs"

            click_on "Create Viewing Party for Reservoir Dogs"
            expect(current_path).to eq(new_user_movie_viewing_party_path(@user, @movie.id))
        end
    end
end