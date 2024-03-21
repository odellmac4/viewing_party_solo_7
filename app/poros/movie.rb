class Movie
    attr_reader :title, :vote_avg

    def initialize(data)
        @title = data[:original_title]
        @vote_avg = data[:vote_average]
    end
end