class CreateEmployees < ActiveRecord::Migration[5.0]
  def change

      create_table :employees do |t|
         t.string  :email, :limit => 50
         t.string  :name,  :limit => 50
         t.string  :cpf,   :limit => 14  
      	 t.decimal :work_hours, :null=> false, :default=> 0       
         t.timestamps
      end
   end
 
end
