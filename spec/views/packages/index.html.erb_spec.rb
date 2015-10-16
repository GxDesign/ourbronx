require 'rails_helper'

RSpec.describe "packages/index", type: :view do
  before(:each) do
    assign(:packages, [
      Package.create!(
        :title => "Title",
        :description => "MyText",
        :notification_params => "MyText",
        :status => "Status",
        :transaction_id => "Transaction"
      ),
      Package.create!(
        :title => "Title",
        :description => "MyText",
        :notification_params => "MyText",
        :status => "Status",
        :transaction_id => "Transaction"
      )
    ])
  end

  it "renders a list of packages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Transaction".to_s, :count => 2
  end
end
