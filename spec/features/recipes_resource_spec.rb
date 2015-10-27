require 'rails_helper'
describe "the navigation on the landing page" do
  it "should allow the user to add a recipe" do
    visit '/'
    click_button "Add a Recipe to our Cookbook"
  end

  it "should allow the user to show all recipes" do
    visit '/'
    click_button "Show All Recipes"
  end
end
describe "the posting of a new recipe" do
  it "should allow user to enter a recipe" do
    visit '/recipes/new'
    fill_in 'Title', :with =>'myTitle'
    fill_in 'Author', :with =>'myAuthor'
    fill_in 'Ingredients', :with =>'myIngredients'
    fill_in 'Instructions', :with =>'myInstructions'
    click_button 'Create Recipe'
    page.should have_content 'myTitle'
    page.should have_content 'myAuthor'
    page.should have_content 'myIngredients'
    page.should have_content 'myInstructions'
    visit '/recipes'
    page.should have_content 'myTitle'
    page.should have_content 'myAuthor'
    page.should have_content 'myIngredients'
    page.should have_content 'myInstructions'


  end
end
