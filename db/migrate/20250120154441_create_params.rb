class CreateParams < ActiveRecord::Migration[7.2]
  def change
    create_table :params do |t|
      t.string :name
      t.string :description
      t.integer :int_content
      t.string :str_content
      t.boolean :bol_content

      t.timestamps
    end
  end
end
