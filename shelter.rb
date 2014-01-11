class Shelter
	attr_reader :name, :address, :clients, :animals
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

	def add_animal(animal)
		@animals << animal
	end

	def add_client(client)
		@clients << client
	end

	def remove_animal(name)
		@animals.each do |animal|
			if animal.name.downcase == name.downcase
				return @animals.delete animal
			end
		end
	end

end
