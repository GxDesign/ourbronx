require 'rails_helper'

RSpec.describe "scholarships/edit", type: :view do
  before(:each) do
    @scholarship = assign(:scholarship, Scholarship.create!())
  end

  it "renders the edit scholarship form" do
    render

    assert_select "form[action=?][method=?]", scholarship_path(@scholarship), "post" do
    end
  end
end
