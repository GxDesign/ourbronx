require 'rails_helper'

RSpec.describe "causes/edit", type: :view do
  before(:each) do
    @cause = assign(:cause, Cause.create!())
  end

  it "renders the edit cause form" do
    render

    assert_select "form[action=?][method=?]", cause_path(@cause), "post" do
    end
  end
end
