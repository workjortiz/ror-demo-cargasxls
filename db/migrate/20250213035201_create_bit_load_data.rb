class CreateBitLoadData < ActiveRecord::Migration[7.2]
  def change
    create_table :bit_load_data do |t|
      t.string :event
      t.string :model
      t.string :action
      t.string :data1
      t.string :data2
      t.string :data3
      t.integer :value1
      t.integer :value2
      t.integer :value3

      t.timestamps
    end
  end
end
