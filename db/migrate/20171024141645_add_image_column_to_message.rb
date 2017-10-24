class AddImageColumnToMessage < ActiveRecord::Migration[5.1]
  def up
    add_attachment :messages, :image
  end

  def down
    remove_attachment :messages, :image
  end
end
