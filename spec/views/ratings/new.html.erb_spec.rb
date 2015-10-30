require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      :rating => 1.5,
      :recipe_id => 1
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input#rating_rating[name=?]", "rating[rating]"

      assert_select "input#rating_recipe_id[name=?]", "rating[recipe_id]"
    end
  end
end
