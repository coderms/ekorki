class CreatePlanZajecs < ActiveRecord::Migration
  def change
    create_table :plan_zajecs do |t|
      t.datetime :data_od
      t.datetime :data_do
      t.string :zoom_room
      t.boolean :active

      t.timestamps null: false
    end
  end
end
