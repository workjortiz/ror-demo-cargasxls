class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.integer :short_code
      t.string :long_code, :limit => 15
      t.string :description, :limit => 120
      t.string :base64_code, :limit => 20
      t.references :brand, null: false, foreign_key: true
      t.references :unit_measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
