class CreateCurrencies < ActiveRecord::Migration[7.2]
  def change
    create_table :currencies do |t|
      t.string :name, :limit => 120
      t.string :iso_code, :limit => 3
      t.references :country, null: false, foreign_key: true
      t.string :short_code, :limit => 1

      t.timestamps
    end
  end
end
