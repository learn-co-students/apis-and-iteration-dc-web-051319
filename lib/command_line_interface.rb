def welcome
  # puts out a welcome message here!
  puts "Hello. Welcome to Star Wars searcher."
end

def get_character_from_user
  puts "Please enter a character name:"
  user_input = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end

def continue?
  puts "Would you like to search again? ( Y / N )"
  user_input = gets.chomp
  user_input = user_input.downcase
  if user_input == "y" || user_input == "yes"
    return true
  elsif user_input == "n" || user_input == "no"
    return false
  else
    puts "Input not recognized."
    continue?
  end
end
