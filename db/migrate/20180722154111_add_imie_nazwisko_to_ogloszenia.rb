class AddImieNazwiskoToOgloszenia < ActiveRecord::Migration
  def change
    add_column :ogloszenia, :imie, :string
    add_column :ogloszenia, :nazwisko, :string
  end
end
