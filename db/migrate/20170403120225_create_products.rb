class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

		t.string  :name
		t.string :variable_name, :null=> false, :default=>""
		t.string  :description
		t.integer :net_profit
        t.timestamps
      end
   end
 
  
end
