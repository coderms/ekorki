class AddKategoriaToOgloszenie < ActiveRecord::Migration[5.0]
  def change
    add_column :ogloszenia, :kategoria, :string
  end
end
