class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.decimal :hour_per_unit
      t.references :employee, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
