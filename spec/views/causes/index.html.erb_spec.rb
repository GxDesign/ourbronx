require 'rails_helper'

RSpec.describe "causes/index", type: :view do
  before(:each) do
    assign(:causes, [
      Cause.create!(),
      Cause.create!()
    ])
  end

  it "renders a list of causes" do
    render
  end
end
