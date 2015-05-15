class CreateDevices < ActiveRecord::Migration
  def up
    create_table :devices do |t|
    t.integer "serial_no"
    t.string "make", :limit => 50
    t.string "model", :limit => 50
    t.boolean("available", :default=>true)
    t.date "day_checked_out"
    t.date "day_due"
    t.integer "person_rented_id_no"
      t.timestamps null: false
    end
  end

  def down
     drop_table :devices
  end 

end
