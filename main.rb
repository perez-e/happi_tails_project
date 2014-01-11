require './animal'
require './client'
require './shelter'

shelter = Shelter.new("Waterfront Shelter", "123 Embarcadero")

def menu message
  puts `clear`
  puts "*** HappiTails v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Display all Animals'
  puts '2 : Display all Clients'
  puts '3 : Create an animal for the shelter'
  puts '4 : Create a client for the shelter'
  puts '5 : Facilitate adoption for animal'
  puts '6 : Facilitate animal being put up for adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when "1"
    message += "All animals in the #{shelter.name}:\n#{shelter.display_animals.join("\n")}"
    # Display all animals in shelter
  when "2"
    message += 'Something here'
    # Display all clients of shelter
    puts shelter.display_clients
    shel
  when "3"
    message += 'Something here'
    # Display available units
  when "4"
    message += "Something here"
    # Display a list of all tenants contact info
  when "5"
    message += "Something here"
    # Show total sqft rented
  when "6"
    message += "Something here"
    # Show annual income of building
  else
      message += "I don't understand ..."
  end
  choice = menu message
end
