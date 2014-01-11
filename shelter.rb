class Shelter
	def initialize(name, address)
		@name = name
		@address = address
		@animals = []
		@clients = []
	end

	def display_clients
		@clients.map do |client|
			client.get_info
		end
	end

	def display_animals
		@animals.map do |animal|
			animal.get_info
		end
	end

	def add_animal_to_shelter(animal)
		@animals << animal
	end
end
