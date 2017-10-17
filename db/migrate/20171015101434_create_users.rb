class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :firstname
      t.string :lastname
      t.string :phonenumber

      t.timestamps
    end
  end
end
