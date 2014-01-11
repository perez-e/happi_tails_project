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
    message += "Clients of the #{shelter.name}:\n#{shelter.display_clients.join("\n")}"
    # Display all clients of shelter
  when "3"
    # 1.) prompt for name, species, gender, age
    # 2.) create instance of animal
    # 3.) place animal in shelter
    print "What species is the animal? "
    species = gets.chomp
    print "What is the name of the #{species}? "
    name = gets.chomp
    print "How old is #{name}? "
    age = gets.to_i
    print "Is is a male or female? "
    gender = gets.chomp
    animal = Animal.new(name, age, gender, species)
    puts "Added animal to shelter"
    shelter.add_animal animal
    puts "\n[Enter to Comtinue]"
    get
    message += 'Successfully added #{species} #{name} to #{shelter.name}'
  when "4"
    # 1.) promp for name, age
    # 2.) create instance of client
    # 3.) add client to shelter
    print "What is the client's name? "
    name = gets.chomp
    print "How old is #{name}? "
    age = gets.to_i
    client  = Client.new(name, age)
    shelter.add_client client
    puts "Added client to the shelter"
    puts "\n[Enter to Continue]"
    gets
    message += "Successfully added #{name} as client to #{shelter.name}"
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
