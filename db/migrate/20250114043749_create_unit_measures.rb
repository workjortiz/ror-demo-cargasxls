class CreateUnitMeasures < ActiveRecord::Migration[7.2]
  def change
    create_table :unit_measures do |t|
      t.string :name
      t.string :iso_code

      t.timestamps
    end
  end
end
