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

  it "can have many tags (maybe)" do
    aRecipe = Recipe.new
    aTag = Tag.new
    aTag2 = Tag.new
    aRecipe.tags << aTag
    aRecipe.tags << aTag2
    expect(aRecipe.tags).to match_array [aTag, aTag2]
  end

  it "can have many ratings (maybe)" do
    aRecipe = Recipe.new
    aRating = Rating.new
    aRating2 = Rating.new
    aRecipe.ratings << aRating
    aRecipe.ratings << aRating2
    expect(aRecipe.ratings).to match_array [aRating, aRating2]
  end

  it "should have an average rating" do
    aRecipe = Recipe.new
    aRecipe.title = "Spaghetti"
    aRecipe.author = "myAuthor"
    aRecipe.ingredients = "myIngredients"
    aRecipe.instructions = "myInstructions"

    aRating = Rating.new
    aRating.rating = 4
    aRating.save

    aRating2 = Rating.new
    aRating2.rating = 5
    aRating2.save

    aRecipe.ratings << aRating
    aRecipe.ratings << aRating2
    expect(aRecipe.save).to eq true

    expect(aRecipe).not_to eq nil
    expect(aRecipe.ratings).not_to eq nil
    expect(aRecipe.ratings).to match_array [aRating, aRating2]
    expect(aRecipe.ratings.average(:rating)).to eq 4.5

  end

end
