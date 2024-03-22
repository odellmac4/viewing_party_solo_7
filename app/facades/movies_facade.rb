class MoviesFacade

    def top_rated_movies
        service = MoviesService.new

        json = service.top_rated_movies

        top_rated_movies = create_movies(json[:results])
    end

    def search_movies(search)
        service = MoviesService.new

        json = service.search_movies(search)
        
        search_movies = create_movies(json[:results])
    end

    def fetch_movie_by_id(movie_id)
        service = MoviesService.new

        json = service.movie_by_id(movie_id)

        movie_by_id = Movie.new(json)
    end

    def movie_cast_members(movie_id)
        service = MoviesService.new

        json = service.movie_cast(movie_id)
        
        cast_members = json[:cast].map do |cast_member_data|
            CastMember.new(cast_member_data)
        end

        first_10_cast_members = cast_members.take(10)
    end

    def movie_reviews(movie_id)
        service = MoviesService.new
    
        json = service.movie_reviews(movie_id)

        reviews = json[:results].map do |review_data|
            Review.new(review_data)
        end
    end

    def create_movies(results)
        results.map do |movie_data|
            Movie.new(movie_data)
        end
    end
end