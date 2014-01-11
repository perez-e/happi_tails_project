class Animal
	attr_accessor :toys
	attr_reader :name, :gender, :species, :age
	def initialize(name, age, gender, species)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
	end

	def get_info
		"name: #{name}".ljust(20)+"species: #{species}".ljust(20)+"age: #{age}".ljust(20) + "gender: #{gender}"
	end
	
end