require 'rails_helper'

RSpec.describe "scholarships/show", type: :view do
  before(:each) do
    @scholarship = assign(:scholarship, Scholarship.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
