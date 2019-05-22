class CreateOgloszenia < ActiveRecord::Migration[5.0]
  def change
    create_table :ogloszenia do |t|
      t.string :tytul
      t.text :opis
      t.string :telefon
      t.timestamps null: false
    end
  end
end
