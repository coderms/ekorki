class AddEmailPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :ogloszenia, :email, :string
    add_column :ogloszenia, :photo, :blob
  end
end
