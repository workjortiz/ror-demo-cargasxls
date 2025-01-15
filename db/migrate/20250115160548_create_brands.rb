class CreateBrands < ActiveRecord::Migration[7.2]
  def change
    create_table :brands do |t|
      t.string :name, :limit => 120
      t.references :country, null: false, foreign_key: true
      t.string :code, :limit => 6

      t.timestamps
    end
  end
end
