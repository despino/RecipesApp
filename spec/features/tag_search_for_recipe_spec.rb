require 'rails_helper'

describe "tag search" do
  it "should search for recipe by tag" do
    visit '/'
    click_button "Search Tags for Recipe"
  end
end
