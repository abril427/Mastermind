class SecretCode
	def initialize(code_type) 
		@code_type = code_type
	end

	def generate_secret_code
		@code_type.generate_computer
	end
end