Class Animal
	attr_accessor :toys
	attr_reader :name, :age, :gender, :species
	def initialize(name, age, gender, species)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = []
	end

	def get_info
		"#{@species}: #{@name}"
	end
end