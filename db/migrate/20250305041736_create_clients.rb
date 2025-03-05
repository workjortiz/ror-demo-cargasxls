class CreateClients < ActiveRecord::Migration[7.2]
  def change
    create_table :clients do |t|
      t.string :fiscal_name, :limit => 120
      t.string :comercial_name, :limit => 120
      t.string :fiscal_address, :limit => 120
      t.string :comercial_address, :limit => 120
      t.string :base64_code, :limit => 20
      t.references :country, null: false, foreign_key: true
      t.references :taxrule, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
