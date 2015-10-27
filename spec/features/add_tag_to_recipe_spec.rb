require 'rails_helper'

describe "adding tag to a recipe" do
  it "should allow the user to enter a tag for a recipe" do
    visit '/recipes/new'
    fill_in('Title', :with => 'myTitle')
    fill_in('Author', :with => 'myAuthor')
    fill_in('Ingredients', :with => 'myIngredients')
    fill_in('Instructions', :with => 'myInstructions')
    click_button 'Create Recipe'
    page.should have_content 'myTitle'
    page.should have_content 'myAuthor'
    page.should have_content 'myIngredients'
    page.should have_content 'myInstructions'
    fill_in('Tag Name', :with => 'myTag')
    click_button 'Add Tag'
    page.should have_content 'myTag'
  end
end
