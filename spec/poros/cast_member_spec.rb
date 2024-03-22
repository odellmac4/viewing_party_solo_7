require 'rails_helper'

RSpec.describe CastMember do
    before(:each) do
        data = {name: "Odell", character: "Scarecrow"}

        @odell = CastMember.new(data)
    end
    it 'is a cast member' do
        expect(@odell).to be_a CastMember
        expect(@odell.name).to eq "Odell"
        expect(@odell.character).to eq "Scarecrow"
    end
end