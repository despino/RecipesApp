require 'rails_helper'

describe "adding a rating to a recipe" do
  it "should allow the user to rate a recipe" do
    visit '/recipes/new'
    fill_in('Title', :with => 'myTitle')
    fill_in('Author', :with => 'myAuthor')
    fill_in('Ingredients', :with => 'myIngredients')
    fill_in('Instructions', :with => 'myInstructions')
    click_button 'Create Recipe'


    select("1 Star", :from => 'rating_id')
    click_button 'Add Rating'
    page.should have_content 'Rating:'
  end
end
