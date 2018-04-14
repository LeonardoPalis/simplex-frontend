class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.decimal :quantity
      t.string :operation
      t.references :product
      t.timestamps
    end
  end
end
