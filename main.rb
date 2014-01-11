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
    puts "\nAdded animal to shelter"
    shelter.add_animal animal
    puts "\n[Enter to Continue]"
    gets
    message += "Successfully added #{species} #{name} to #{shelter.name}"
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
    puts "\nAdded client to the shelter"
    puts "\n[Enter to Continue]"
    gets
    message += "Successfully added #{name} as client to #{shelter.name}"
  when "5"
    puts "Available clients to choose from:"
    puts shelter.display_clients.join("\n")
    print "\nWhich client wants to adopt a pet? [enter name of client] "
    client_name = gets.chomp
    puts "\nAvailable animals to choose from:"
    puts shelter.display_animals
    print "\nWhich animal does #{client_name} want to adopt? [enter name of animal] "
    animal_name = gets.chomp
    animal_condition = nil
    shelter.clients.each do |client|
      if client.name.downcase == client_name.downcase
        animal_condition = shelter.has_animal?(animal_name)
        client.adopt_animal(shelter.remove_animal(animal_name)) if shelter.has_animal?(animal_name)
      end
    end
    if animal_condition && shelter.has_client?(client_name)
      puts "\nAnimal transaction occured"
      puts "\n[Enter to Continue]"
      gets
      message += "#{client_name} successfully adopted #{animal_name}"
    # Promp for client, and which animal
    else
      message = "Error occurred during adoption process. Invalid client or animal."
    end

  when "6"
    puts "Available clients to choose from:"
    puts shelter.display_clients.join("\n")
    print "\nWhich client wants to put a pet up for adoption? [enter name of client] "
    client_name = gets.chomp
    pet_condition = nil
    shelter.clients.each do |client|
      if client.name.downcase == client_name.downcase
        puts "\nClient's Info:"
        puts client.get_info
        print "\nWhich pet is #{client_name} willing to depart with? [enter name of pet] "
        pet_name = gets.chomp
        pet_condition = client.has_pet?(pet_name)
        shelter.add_animal(client.put_for_adoption(pet_name)) if client.has_pet?(pet_name)
      end
    end
    if shelter.has_client?(client_name) && pet_condition
      puts "\nPet transaction occured"
      puts "\n[Enter to Continue]"
      gets
      message += "#{client_name} successully put #{animal_name} up for adoption."
    else
      message = "Error occurred during putting up for adoption. Invalid client or animal."
    end
  else
      message += "I don't understand ..."
  end
  choice = menu message
end
