class CreateWiadomosci < ActiveRecord::Migration[5.2]
  def change
    create_table :wiadomosci do |t|
      t.string :tekst
      t.string :email
      t.text :szczegoly
      t.date :created_at

      t.timestamps null: false
    end
    add_column :wiadomosci, :uzytkownik_id, :integer, references: :uzytkowniks, index: true
  end
end
