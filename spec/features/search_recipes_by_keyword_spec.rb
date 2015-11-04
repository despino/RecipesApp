require 'rails_helper'

describe "Search by keyword" do
  before(:each) do
    aRecipe = Recipe.new
    aRecipe.title = "Chicken Soup"
    aRecipe.author = "myAuthor"
    aRecipe.ingredients = "Chicken and Soup"
    aRecipe.instructions = "Boil water, Add Chicken, Add Broth."
    aRecipe.save
  end

  before(:each) do
    visit'/users/sign_up'
    fill_in('Username', with: 'Foo')
    fill_in('Email', with: 'Foo@bar.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button 'Sign up'
  end

  it "should allow the user to search by empty keyword" do
    visit '/recipes/search'
    fill_in("Search for:", :with => "")
    click_button 'Search'
    page.should have_content 'No Recipes Found'
  end

  it "should allow the user to search by keyword where no recipes are found" do
    visit '/recipes/search'
    fill_in('Search for:', :with => 'Herring')
    click_button 'Search'
    page.should have_content 'No Recipes Found'
  end

  it "should allow the user to search by keyword where some recipes are found" do
    visit '/recipes/search'
    fill_in('Search for:', :with => 'Chicken')
    click_button 'Search'
    page.should have_content 'Chicken Soup'
  end

  it "should allow the user to search by partial keyword where some recipes are found" do
    visit '/recipes/search'
    fill_in('Search for:', :with => 'hick')
    click_button 'Search'
    page.should have_content 'Chicken Soup'
  end


end
