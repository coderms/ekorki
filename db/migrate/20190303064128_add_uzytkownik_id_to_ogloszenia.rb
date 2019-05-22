class AddUzytkownikIdToOgloszenia < ActiveRecord::Migration[5.0]
  def change
    add_column :ogloszenia, :uzytkownik_id, :integer, references: :uzytkowniks, index: true
  end
end
