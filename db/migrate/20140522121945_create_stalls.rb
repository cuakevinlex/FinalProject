class CreateStalls < ActiveRecord::Migration
  def change
    create_table :stalls do |t|
      t.string :name
      t.text :description
	  t.references :cafeterium
	  
      t.timestamps
    end
  end
end
