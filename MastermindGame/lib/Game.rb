require 'feedback'
require 'IO'
require 'ConsoleUserInput'
require 'MockUserInput'
require 'secretcode'

class Game
	attr_accessor :move
	attr_accessor :guess

	def initialize(user_input, code_type)
		@feedback = Feedback.new	
		@io = IO.new(user_input)
		@move = ""
		@guess = []
		@turns = 10
		@secret_code = SecretCode.new(code_type)
		@answer = ""
	end

	def start_game
		welcome_message	
	end

	def game_loop
		@code = @secret_code.generate_secret_code
		while @turns > 0
			@io.turns_left(@turns)
			ask_for_guess
			get_move
	 		validate_user_guess
	 		convert_guess
	 		player_feedback
	 		end_game_early
	 		@turns -= 1	
	 	end 
	 	end_game
	 	play_again?
	 	restart
	end

	def welcome_message
      @io.welcome_message	
	end

	def ask_for_guess
		@io.ask_for_guess
	end

	def get_move
      @move = @io.get_guess
	end

	def validate_user_guess
		unless @move =~ /[0-9][0-9][0-9][0-9]/ && @move.length == 4
			@io.incorrect_guess 
			ask_for_guess
			get_move
			validate_user_guess 
		end		
	end

	def convert_guess
		@guess = @move.split(//).map(&:to_i)
	end

	def player_feedback
	 	unless @feedback.guessed_correctly?(@guess, @code) == true 
			right_spot_numbers = @feedback.right_spot_key_pegs(@guess, @code) 	
			@io.display_right_spot_numbers(right_spot_numbers)

			wrong_spot_number = @feedback.wrong_spot_key_pegs(@guess, @code)
			@io.display_wrong_spot_numbers(wrong_spot_number)
		end
	end

	def end_game_early
		if @feedback.guessed_correctly?(@guess, @code) == true && @turns > 0
			@turns = 0
			@io.win
		end
	end

	def end_game
		if @feedback.guessed_correctly?(@guess, @code) == false && @turns == 0
			@io.lose
			@io.computer_numbers(@code)
		elsif @feedback.guessed_correctly?(@guess, @code) == true && @turns == 0
			@io.win
		end			
 	end

	 def play_again?
 		@io.ask_to_play_again
 		@answer = @io.get_play_again
 	end

 	def restart
 		if @answer == "y"
 			@turns = 10
	 		game_loop
	 	else
	 		@io.end_message
	 	end
	 end
end