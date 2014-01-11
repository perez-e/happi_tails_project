class Client
	attr_reader :name, :age
	attr_accessor :children, :pets
	
	def initialize(name, age)
		@name = name
		@age = age
		@pets = []
		@children = []
	end
end