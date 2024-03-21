class MoviesFacade

    def top_rated_movies
        service = MoviesService.new

        json = service.top_rated_movies

        top_rated_movies = create_movies(json[:results])
    end

    def search_movies(search)
        # binding.pry
        service = MoviesService.new

        json = service.search_movies(search)
        
        search_movies = create_movies(json[:results])
    end

    def create_movies(results)
        results.map do |movie_data|
            Movie.new(movie_data)
        end
    end
end