class CreateZajecies < ActiveRecord::Migration[5.0]
  def change
    create_table :zajecies do |t|
      t.string :temat
      t.string :opis
      t.integer :ilosc_uczniow
      t.string :program
      t.belongs_to :plan_zajecs, index: true
      t.integer :nauczyciel_id

      t.timestamps null: false
    end
  end
end
