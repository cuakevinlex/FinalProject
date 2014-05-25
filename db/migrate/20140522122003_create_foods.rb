class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :price
	  t.text :photo #link to photo
	  t.references :stall
	  
      t.timestamps
    end
  end
end
