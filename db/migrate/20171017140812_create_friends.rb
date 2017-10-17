class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :friend_id, references: :user

      t.timestamps
    end
  end
end
