class Movie
    attr_reader :title, :vote_avg, :id

    def initialize(data)
        @title = data[:original_title]
        @vote_avg = data[:vote_average]
        @id = data[:id]
    end
end