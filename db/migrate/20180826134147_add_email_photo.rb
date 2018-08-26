class AddEmailPhoto < ActiveRecord::Migration
  def change
    add_column :ogloszenia, :email, :string
    add_column :ogloszenia, :photo, :blob
  end
end
