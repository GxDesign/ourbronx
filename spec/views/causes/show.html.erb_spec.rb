require 'rails_helper'

RSpec.describe "causes/show", type: :view do
  before(:each) do
    @cause = assign(:cause, Cause.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
