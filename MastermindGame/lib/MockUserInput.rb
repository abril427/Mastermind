class MockUserInput 
	attr_accessor :messages

	def initialize(mock_guesses) 
		@messages = []
		@mockguesses = mock_guesses
	end

	def input
		guess = @mockguesses.pop
	end 

	def output(message)
		@messages << message
	end

end

 