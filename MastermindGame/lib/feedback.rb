class Feedback

	def right_spot_key_pegs (player, computer)
		array_index = 0
		right_numbers = 0
		while array_index < 4
			if player[array_index] == computer[array_index]
				right_numbers += 1
			end
			array_index += 1
		end 
		right_numbers
	end

	def wrong_spot_key_pegs(player, computer)
		array_index = 0
		wrong_numbers = 0
		while array_index < 4
			unless computer[array_index] == player[array_index]
				if player.include?(computer[array_index])
					wrong_numbers += 1
					player.map! { |x| x == computer[array_index] ? nil : x }					
				end
			end
			array_index += 1
		end
		wrong_numbers
	end

	def guessed_correctly?(player, computer)
		unless player == computer
			return false
		end
		return true 
	end
end




