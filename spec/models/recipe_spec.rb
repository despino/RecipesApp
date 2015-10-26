require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "should have a title" do
    aRecipe = Recipe.new
    aRecipe.title = "myTitle"
    expect(aRecipe.title).to eq "myTitle"
  end

  it "should have a author" do
    aRecipe = Recipe.new
    aRecipe.author = "myAuthor"
    expect(aRecipe.author).to eq "myAuthor"
  end

  it "should have ingredients" do
    aRecipe = Recipe.new
    aRecipe.ingredients = "blah"
    expect(aRecipe.ingredients).to eq "blah"
  end

  it "should have instructions" do
    aRecipe = Recipe.new
    aRecipe.instructions = "blah-blah"
    expect(aRecipe.instructions).to eq "blah-blah"
  end


end
