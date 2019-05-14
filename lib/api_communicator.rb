require 'rest-client'
require 'json'
require 'pry'
require_relative "command_line_interface.rb"

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # collect those film API urls, make a web request to each URL to get the info
  # for that film

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


  # iterate over the response hash to find the collection of `films` for the given
  # `character`

  val = response_hash["results"]

  character_info = val.find do |character_hash|
    character_hash["name"] == character_name
  end

  films = character_info["films"]

    url_films = []

    films.each do |item|
    film_string = RestClient.get(item)

    url_films << JSON.parse(film_string)

    return url_films
  end
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  val = films
  titles = []

  val.each do |title_hash|
  title_hash.each do |key, value|
      if key == "title"
        titles << value
      end
    end
    i = 0
    titles.each do |film|
      i += 1
      puts "#{i}. #{film}"
    end
  end
end

#method to easily print information
def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


## BONUS
# that `get_character_movies_from_api` method is probably pretty long.
#Does it do more than one job?
# can you split it up into helper methods?
