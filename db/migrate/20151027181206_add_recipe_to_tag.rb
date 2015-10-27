class AddRecipeToTag < ActiveRecord::Migration
  def change
    add_column :tags, :recipe_id, :integer
  end
end
