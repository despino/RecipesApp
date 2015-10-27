require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "should have a name" do
    aTag = Tag.new
    aTag.name = "chicken"
    expect(aTag.name).to eq "chicken"
  end
  it "should not except an empty name" do
    aTag = Tag.new
    expect(aTag.valid?).to eq false
    aTag.name = "chicken"
    expect(aTag.valid?).to eq true
  end

  it "should have a recipe" do
    aTag = Tag.new
    aTag.name = "newTag"
    aRecipe = Recipe.new
    aTag.recipe = aRecipe
    expect(aTag.recipe).to eq aRecipe
  end
end
