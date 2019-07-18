#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def main
    welcome
    character = get_character_from_user
    film_list = show_character_movies(character)
    if film_list == false
        puts "Name not found."
        main
    else
        film_list
        if continue?
          main
        else
puts "                       .-. "
puts "                      |_:_| "
puts "                     /(_Y_)\ "
puts ".                   ( \/M\/ ) "
puts " '.               _.'-/'-'\-'._ "
puts "   ':           _/.--'[[[[]'--.\_ "
puts "     ':        /_'  : |::| :  '.\ "
puts "       ':     //   ./ |oUU| \.'  :\ "
puts "         ':  _:'..' \_|___|_/ :   :| "
puts "           ':.  .'  |_[___]_|  :.':\ "
puts "            [::\ |  :  | |  :   ; : \ "
puts "             '-'   \/'.| |.' \  .;.' | "
puts "             |\_    \  '-'   :       | "
puts "             |  \    \ .:    :   |   | "
puts "             |   \    | '.   :    \  | "
puts "             /       \   :. .;       | "
puts "            /     |   |  :__/     :  \\ "
puts "           |  |   |    \:   | \   |   || "
puts "          /    \  : :  |:   /  |__|   /| "
puts "      snd |     : : :_/_|  /'._\  '--|_\ "
puts "          /___.-/_|-'   \  \ "
puts "                         '-' "
puts "                      Goodbye"
        end
    end
end

main
