class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string "first_name", :limit => 50
      t.string "last_name", :limit => 50
      t.integer "id_no"
      
      t.timestamps null: false
    end
  end

  def down
     drop_table :people
  end 


end
