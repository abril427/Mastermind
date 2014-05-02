require 'rubygems'
require 'bundler'
# Bundler.require
require 'simplecov'
SimpleCov.start

require 'Game'
require 'feedback'
require 'MockUserInput'
require 'mocksecretcode'

describe Game do
	
	it 'should guess the game in one guess' do
		guesses = ["1234"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	end 

	it 'should guess the secret code in 5 guesses' do
		guesses = ["1234", "1243", "4567", "4357", "6789"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 1 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	end

	it 'should guess the code after using all 10 turns' do
		guesses = ["1234", "1243", "4567", "4357", "6789", "1237", "6709", "5667", "2453", "1144"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 3 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 5 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 4 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 3 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 1 number(s) right but in the wrong spot.", "You have 2 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 1 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	end

	it 'should not be able to guess the code' do
		guesses = ["1230", "1243", "4567", "4357", "6789", "1237", "6709", "5667", "2453", "1144"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 3 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 5 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 4 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 3 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 1 number(s) right but in the wrong spot.", "You have 2 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 1 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You were unable to guess correctly, you lose.", "The numbers were [1, 2, 3, 4]", "Would you like to play again? y/n", "Thank you for playing!"]
	end

	it 'should be able to recognize an invalid guess with letters' do
		guesses = ["1234", "1243", "4567", "4357", "6789", "1237", "6709", "5667", "2453", "1144", "114a"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "Please enter a valid guess.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 3 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 5 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 4 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 3 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 1 number(s) right but in the wrong spot.", "You have 2 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 1 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	end

	it 'should be able to recognize a guess that is less than 4 digts' do
	guesses = ["1234", "1243", "4567", "4357", "678", "1237", "6709", "5667", "2453", "1144", "1143"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You have 1 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 3 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 5 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 4 turn(s) left.", "What is your guess?", "Please enter a valid guess.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 3 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 1 number(s) right but in the wrong spot.", "You have 2 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 1 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	end

	it 'should be able to recognize a guess that is more than 4 digits' do
	guesses = ["1234", "1243", "456567", "4357", "6784", "1237", "6709", "5667", "2453", "1144", "1143"]
		mockuserinput = MockUserInput.new(guesses)
		mocksecretcode = MockSecretCode.new
		game = Game.new(mockuserinput, mocksecretcode)
		game.start_game
		game.game_loop
		mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You have 1 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 3 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 5 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 4 turn(s) left.", "What is your guess?", "You have 1 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 3 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 2 turn(s) left.", "What is your guess?", "Please enter a valid guess.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 1 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	end

	# it 'should be able to recognize if you want to play again' do
	# 	guesses = ["1234", "4567", "4357", "6784", "1237", "6709", "5667", "2453", "1144", "1143"]
	# 	mockuserinput = MockUserInput.new(guesses)
	# 	mocksecretcode = MockSecretCode.new
	# 	game = Game.new(mockuserinput, mocksecretcode)
	# 	game.start_game
	# 	game.game_loop
	# 	mockuserinput.messages.should == ["Welcome to Mastermind.", "You have 10 turn(s) left.", "What is your guess?", "You have 1 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 9 turn(s) left.", "What is your guess?", "You have 2 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 8 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 3 number(s) right but in the wrong spot.", "You have 7 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 6 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 5 turn(s) left.", "What is your guess?", "You have 3 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 4 turn(s) left.", "What is your guess?", "You have 1 number(s) in the right spot.", "You have 0 number(s) right but in the wrong spot.", "You have 3 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 2 number(s) right but in the wrong spot.", "You have 2 turn(s) left.", "What is your guess?", "You have 0 number(s) in the right spot.", "You have 1 number(s) right but in the wrong spot.", "You have 1 turn(s) left.", "What is your guess?", "You guessed correctly, you win!", "Would you like to play again? y/n", "Thank you for playing!"]
	# end
end