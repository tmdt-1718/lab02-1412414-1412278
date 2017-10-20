class User < ApplicationRecord
	has_many :messages
	has_many :friends

	has_secure_password
end
