class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends, {:id => false} do |t|
      t.references :user, foreign_key: true
      t.references :friend, references: :user

      t.timestamps
    end

    execute "ALTER TABLE friends ADD PRIMARY KEY (user_id, friend_id);"
  end
end
