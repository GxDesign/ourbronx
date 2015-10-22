require 'rails_helper'

RSpec.describe "causes/new", type: :view do
  before(:each) do
    assign(:cause, Cause.new())
  end

  it "renders new cause form" do
    render

    assert_select "form[action=?][method=?]", causes_path, "post" do
    end
  end
end
