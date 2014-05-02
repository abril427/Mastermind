require 'rubygems'
require 'bundler'
Bundler.require
require 'simplecov'
SimpleCov.start

require 'IO'
require 'MockUserInput'

describe IO do
	before :each do
		@mockuserinput = MockUserInput.new(["1234"])
		@io = IO.new(@mockuserinput)
	end

	it 'should print a welcome message' do
		@io.welcome_message
		@mockuserinput.messages.should == ["Welcome to Mastermind."]
	end

	it 'should ask for a guess' do
		@io.ask_for_guess
		@mockuserinput.messages.should == ["What is your guess?"]
	end

	it 'should get user guess' do
		@io.get_guess.should == "1234"
	end 

	it 'should tell user how many turns are remaining' do
		@io.turns_left(5)
		@mockuserinput.messages.should == ["You have 5 turn(s) left."]
	end

	it 'should display how many numbers are in the right spot' do
		@io.display_right_spot_numbers(2)
		@mockuserinput.messages.should == ["You have 2 number(s) in the right spot."]
	end

	it 'should display how many numbers are right but in the wrong spot' do
		@io.display_wrong_spot_numbers(2)
		@mockuserinput.messages.should == ["You have 2 number(s) right but in the wrong spot."]
	end 

	it 'should ask for a valid guess' do 
		@io.incorrect_guess
		@mockuserinput.messages.should == ["Please enter a valid guess."]
	end

	it 'should tell you you won' do
		@io.win
		@mockuserinput.messages.should == ["You guessed correctly, you win!"]
	end

	it 'should tell you you lose' do
		@io.lose
		@mockuserinput.messages.should == ["You were unable to guess correctly, you lose."]
	end

	it 'should tell you what the computer numbers were' do
		@io.computer_numbers([1, 2, 3, 4])
		@mockuserinput.messages.should == ["The numbers were [1, 2, 3, 4]"]
	end

	it 'should ask you if you want to play again' do
		@io.ask_to_play_again
		@mockuserinput.messages.should == ["Would you like to play again? y/n"]
	end	

	it 'should thank you for playing' do
		@io.end_message
		@mockuserinput.messages.should == ["Thank you for playing!"]
	end
end