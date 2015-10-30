require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :rating => 1.5,
        :recipe_id => 1
      ),
      Rating.create!(
        :rating => 1.5,
        :recipe_id => 1
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
