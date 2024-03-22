require 'rails_helper'

RSpec.describe Review do
    before(:each) do
        data = {author: "Odell", content: "Good Movie"}
        @review = Review.new(data)
    end
    it 'is a review' do
        expect(@review).to be_a Review
        expect(@review.author).to eq("Odell")
        expect(@review.content).to eq("Good Movie")
    end
end