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

	def has_client?(name)
		!@clients.select {|client| client.name.downcase == name.downcase}.empty?
	end

	def has_animal?(name)
		!@animals.select {|animal| animal.name.downcase == name.downcase}.empty?
	end

	def access_client(name)
		@clients.each do |client|
			return client if client.name.downcase == name.downcase
		end
	end

end
