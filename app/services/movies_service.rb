class MoviesService
    def top_rated_movies
        get_url("/3/movie/top_rated")
    end

    def search_movies(search)
        get_url("/3/search/movie?query=#{search}")
    end

    def get_url(url)
        response = conn.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end

    def conn
        Faraday.new(
            url: "https://api.themoviedb.org",
            params: {api_key: Rails.application.credentials.tmdb[:key]}
            )
    end
end