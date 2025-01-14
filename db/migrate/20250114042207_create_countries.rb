class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :name, :limit => 120
      t.string :iso_code, :limit => 3
      t.integer :region_code

      t.timestamps
    end
  end
end
