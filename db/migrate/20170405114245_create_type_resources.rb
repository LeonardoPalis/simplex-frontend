class CreateTypeResources < ActiveRecord::Migration[5.0]
  def change
    create_table :type_resources do |t|
      t.string :name
      t.integer :max_quantity
      t.timestamps
    end
  end
end
