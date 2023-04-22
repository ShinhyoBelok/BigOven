class AddCookingStepsToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :cooking_steps, :text
  end
end
