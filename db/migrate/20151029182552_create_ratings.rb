class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :rating
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
