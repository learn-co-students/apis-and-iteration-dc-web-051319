require 'rest-client'
require 'json'
require 'pry'

def get_movies_from_api
    # make the web request
    response_string = RestClient.get('http://www.swapi.co/api/people/')
    response_hash = JSON.parse(response_string)
end

def get_character(movies, character_name)
    # find given character in movies hash
    movies["results"].find{ |char| char["name"].downcase == character_name.downcase }
end

def get_movies(character_info)
    # check if character exists, if so evalute links as array
    if character_info
        character_info["films"].map do |film_link|
            JSON.parse(RestClient.get(film_link))
        end
    else
        return nil
    end
end

def print_movies(films)
    # return pretty list of films character appears in
    if films
        i = 0
        films.each do |film|
            i += 1
            puts "#{i} #{film["title"]}"
        end
    else
        puts "Not a character in Star Wars."
    end
end

def show_character_movies(character)
    info = get_character(get_movies_from_api, character)
    films = get_movies(info)
    print_movies(films)
end
