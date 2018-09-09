class AddKategoriaToOgloszenie < ActiveRecord::Migration
  def change
    add_column :ogloszenia, :kategoria, :string
  end
end
