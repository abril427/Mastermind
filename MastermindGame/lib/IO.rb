class IO
	def initialize(io_type) 
		@io_type = io_type
	end

	def welcome_message
		@io_type.output("Welcome to Mastermind.")
	end 	

	def ask_for_guess
		@io_type.output("What is your guess?")
	end

	def get_guess
		@io_type.input
	end

	def get_play_again
		@io_type.input
	end

	def turns_left(turns_remaining)
		@io_type.output("You have " + turns_remaining.to_s + " turn(s) left.")
	end

	def display_right_spot_numbers(right_numbers)
		@io_type.output("You have " + right_numbers.to_s + " number(s) in the right spot.")
	end

	def display_wrong_spot_numbers(wrong_numbers)
		@io_type.output("You have " + wrong_numbers.to_s + " number(s) right but in the wrong spot.")
	end

	def incorrect_guess
		@io_type.output("Please enter a valid guess.")
	end

	def win
		@io_type.output("You guessed correctly, you win!")
	end

	def lose
		@io_type.output("You were unable to guess correctly, you lose.")
	end

	def computer_numbers(computer)
		@io_type.output("The numbers were " + computer.to_s)
	end

	def ask_to_play_again
		@io_type.output("Would you like to play again? y/n")
	end

	def end_message
		@io_type.output("Thank you for playing!")
	end
end 