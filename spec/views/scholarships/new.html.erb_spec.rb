require 'rails_helper'

RSpec.describe "scholarships/new", type: :view do
  before(:each) do
    assign(:scholarship, Scholarship.new())
  end

  it "renders new scholarship form" do
    render

    assert_select "form[action=?][method=?]", scholarships_path, "post" do
    end
  end
end
