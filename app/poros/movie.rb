class Movie
    attr_reader :title, 
                :vote_avg, 
                :id,
                :summary,
                :runtime,
                :reviews

    def initialize(data)
        @title = data[:title]
        @vote_avg = data[:vote_average]
        @id = data[:id]
        @summary = data[:overview]
        @genres = data[:genres]
        @runtime = data[:runtime]
        @reviews = MoviesFacade.new.movie_reviews(@id)
    end

    def genres
        genre_names = @genres.map do |genre|
            genre[:name]
        end
    end

    def cast
        top_10_cast_members = MoviesFacade.new.movie_cast_members(@id)
    end

    def review_count
        @reviews.count
    end
end