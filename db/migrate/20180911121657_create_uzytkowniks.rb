class CreateUzytkowniks < ActiveRecord::Migration
  def change
    create_table :uzytkowniks do |t|
      t.string :imie
      t.string :nazwisko
      t.string :haslo
      t.string :email
      t.date :created_at

      t.timestamps null: false
    end
    add_column :uzytkowniks, :photo, :blob
  end
end
