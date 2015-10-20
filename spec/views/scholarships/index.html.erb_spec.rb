require 'rails_helper'

RSpec.describe "scholarships/index", type: :view do
  before(:each) do
    assign(:scholarships, [
      Scholarship.create!(),
      Scholarship.create!()
    ])
  end

  it "renders a list of scholarships" do
    render
  end
end
