require 'rails_helper'

RSpec.describe "Causes", type: :request do
  describe "GET /causes" do
    it "works! (now write some real specs)" do
      get causes_path
      expect(response).to have_http_status(200)
    end
  end
end
