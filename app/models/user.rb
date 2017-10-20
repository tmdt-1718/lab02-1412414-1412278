class User < ApplicationRecord
	has_many :messages
	has_many :friends

	has_secure_password

	def self.from_omiauth(auth_hash)
		user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
		user.first_name = auth_hash['info']['first_name']
		user.last_name = auth_hash['info']['last_name']
		user.email = auth_hash['info']['email']
		user.password = '123456'
		user.id = User.maximum("id") + 1

		user.save!
		user
	end
end
