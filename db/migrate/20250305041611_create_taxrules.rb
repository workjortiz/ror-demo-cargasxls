class CreateTaxrules < ActiveRecord::Migration[7.2]
  def change
    create_table :taxrules do |t|
      t.string :name, :limit => 120
      t.string :code, :limit => 5
      t.integer :value_rule

      t.timestamps
    end
  end
end
