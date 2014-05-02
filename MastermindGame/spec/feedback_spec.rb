require 'rubygems'
require 'bundler'
Bundler.require
require 'simplecov'
SimpleCov.start

require 'feedback'

describe Feedback do
	before :each do
	@feedback = Feedback.new
	@random = Random.new
	end	

	it 'should give one right spot peg' do 
		@feedback.right_spot_key_pegs([1, 2, 3, 4], [1, 5, 6, 7]).should == 1
	end

	it 'should give one wrong spot number' do
		@feedback.wrong_spot_key_pegs([1, 3, 3, 3], [3, 2, 2, 2]).should == 1
	end

	it 'should give 2 right numbers' do		
		@feedback.right_spot_key_pegs([1, 7, 3, 4], [1, 2, 3, 6]).should == 2
	end

	it 'should give 2 wrong numbers' do 
		@feedback.wrong_spot_key_pegs([1, 3, 2, 2], [3, 1, 4, 4]).should == 2

	end

	it 'should give 1 right number and 1 wrong number' do 
		@feedback.right_spot_key_pegs([1, 3, 2, 2], [1, 4, 4, 3]).should == 1
		@feedback.wrong_spot_key_pegs([1, 3, 2, 2], [1, 4, 4, 3]).should == 1
	end

	it 'should give 1 right number and 1 wrong number even with duplicates in guess' do
		@feedback.right_spot_key_pegs([1, 2, 3, 3], [1, 3, 4, 4]).should == 1
		@feedback.wrong_spot_key_pegs([1, 2, 3, 3], [1, 3, 4, 4]).should == 1
	end	
		
	it 'should give 1 right number and 1 wrong number even with duplicates in code' do
		@feedback.right_spot_key_pegs([1, 3, 2, 2], [1, 4, 3, 3]).should == 1
		@feedback.wrong_spot_key_pegs([1, 3, 2, 2], [1, 4, 3, 3]).should == 1
	end	

	it 'should guess correctly' do
		@feedback.guessed_correctly?([1, 2, 3, 4], [1, 2, 3, 4]).should == true
	end

	it 'should guess incorrectly' do
		@feedback.guessed_correctly?([1, 2, 3, 5], [1, 2, 3, 4]).should == false
	end
end