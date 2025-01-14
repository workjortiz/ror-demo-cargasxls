class CreateUnitMeasures < ActiveRecord::Migration[7.2]
  def change
    create_table :unit_measures do |t|
      t.string :name, :limit => 120
      t.string :iso_code, :limit => 3

      t.timestamps
    end
  end
end
