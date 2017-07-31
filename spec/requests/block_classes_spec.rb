require 'rails_helper'

RSpec.describe "BlockClasses", type: :request do
  describe "GET /block_classes" do
    it "works! (now write some real specs)" do
      get block_classes_path
      expect(response).to have_http_status(200)
    end
  end
end
