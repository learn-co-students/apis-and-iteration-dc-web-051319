require 'rest-client'
require 'json'
require 'pry'
=begin
def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film

  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  
  character_hash = response_hash["results"].find do |hash|
    hash["name"] == character_name
  end
 
  if character_hash
    character_hash["films"].collect do |film|
      response_string_film = RestClient.get(film)
      response_hash_film = JSON.parse(response_string_film)
    end
  else
     false
  end
end
=end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character_hash = find_character(character_name, response_hash)
  find_films(character_hash)
end

def find_character(character_name, response_hash)
  response_hash["results"].find do |hash|
    hash["name"].downcase == character_name.downcase
  end
end

def find_films(character_hash)
  if character_hash
    character_hash["films"].collect do |film|
      response_string_film = RestClient.get(film)
      response_hash_film = JSON.parse(response_string_film)
    end
  else
    false
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
    sorted_films = films.sort do |a, b|
      a["release_date"][0...4].to_i <=> b["release_date"][0...4].to_i
    end
    sorted_films.each do |film|
      puts "*********************"
      puts "#{film["release_date"][0...4]} #{film["title"]}"
    end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  if films == false
    false
  else 
    print_movies(films)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
