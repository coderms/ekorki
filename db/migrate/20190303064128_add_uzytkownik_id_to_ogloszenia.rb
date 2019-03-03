class AddUzytkownikIdToOgloszenia < ActiveRecord::Migration
  def change
    add_column :ogloszenia, :uzytkownik_id, :integer, references: :uzytkowniks, index: true
  end
end
