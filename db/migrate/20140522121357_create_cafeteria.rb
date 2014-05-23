class CreateCafeteria < ActiveRecord::Migration
  def change
    create_table :cafeteria do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
