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
		"#{@name}: #{@pets}"
	end

	def put_for_adoption(name)
		@pets.each do |pet|
			if pet.name == name
				@pets.delete pet
			end
		end
	end

	def adopt_animal(animal)
		@pets << animal
	end
end