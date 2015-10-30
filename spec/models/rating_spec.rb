require 'rails_helper'

RSpec.describe Rating, type: :model do
  it "should have a recipe" do
    aRating = Rating.new
    aRating.rating = 5
    aRecipe = Recipe.new
    aRating.recipe = aRecipe
    expect(aRating.recipe).to eq aRecipe
  end
end
