class Friend < ApplicationRecord
  belongs_to :user

  self.primary_keys = :user_id, :friend_id
end
