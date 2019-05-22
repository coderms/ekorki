class UpdatePlanZajec < ActiveRecord::Migration[5.0]
  def change
      add_column :plan_zajecs, :ogloszenie_id, :integer, references: :uzytkowniks, index: true
      add_column :plan_zajecs, :dzien_tyg, :string
      add_column :plan_zajecs, :godzina_od, :time
      add_column :plan_zajecs, :godzina_do, :time
  end
end
