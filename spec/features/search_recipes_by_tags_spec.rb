require 'rails_helper'

describe 'search_recipes_by_tags' do
  it 'should load an empty field form ' do
    visit '/tags/search'
    expect(find_field(:search_string).value).to eq nil
  end

  it "should return no recipes found if there is no corresponding tag" do
    visit '/tags/search?search_string=butter'
    page.should have_content "No Recipes Found!"
  end

  it 'should find recipes corresponding to tag' do
    aRecipe = Recipe.new
    aRecipe.title = "Spaghetti"
    aRecipe.author = "myAuthor"
    aRecipe.ingredients = "myIngredients"
    aRecipe.instructions = "myInstructions"
    aRecipe.save
    aTag = Tag.new
    aTag.name = "bacon"
    aTag.recipe = aRecipe
    aTag.save
    visit '/tags/search?search_string=bacon'
    page.should have_content 'Recipes Found:'
    page.should have_content 'Spaghetti'
  end

end
