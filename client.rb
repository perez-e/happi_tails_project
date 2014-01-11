class Client
	attr_reader :name, :age
	attr_accessor :children, :pets

	def initialize(name, age)
		@name = name
		@age = age
		@pets = []
		@children = []
	end

	def get_info
		pet_str = ""
		@pets.each {|pet| pet_str << "#{pet.name} -> #{pet.species}, "}
		"name: #{@name}\npets: #{pet_str[0...-2]}\n"
	end

	def put_for_adoption(name)
		@pets.each do |pet|
			if pet.name.downcase == name.downcase
				return @pets.delete pet
			end
		end
	end

	def adopt_animal(animal)
		@pets << animal
	end
end