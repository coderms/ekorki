class AddImieNazwiskoToOgloszenia < ActiveRecord::Migration[5.0]
  def change
    add_column :ogloszenia, :imie, :string
    add_column :ogloszenia, :nazwisko, :string
  end
end
