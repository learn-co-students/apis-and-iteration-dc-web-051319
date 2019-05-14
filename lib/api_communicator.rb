require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  sw_character_films = []


sw_films = response_hash["results"].find do |hash|
    hash["name"].downcase == character_name.downcase
  end


    sw_films["films"].each do |film_url|
      sw_response_string = RestClient.get(film_url)
      sw_response_hash = JSON.parse(sw_response_string)
      sw_character_films <<  sw_response_hash["title"]
    end
    sw_character_films

  end



# add another step to parse the results hash




  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.



def print_movies(films)
  films.each_with_index do |value , index|
    puts "#{index + 1}. #{value}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

#get_character_movies_from_api("Luke Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
