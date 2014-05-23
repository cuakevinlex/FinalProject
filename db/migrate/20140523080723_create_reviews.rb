class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user
      t.integer :rating
      t.text :comment
	  t.references :stall
	  
      t.timestamps
    end
  end
end
