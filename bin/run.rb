#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def main
    welcome
    character = get_character_from_user
    film_list = show_character_movies(character)
    if film_list == false
        puts "Incorrect character name"
        main
    else
        film_list
    end
end

main