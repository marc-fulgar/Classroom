require 'rails_helper'

RSpec.describe "advisories/index", type: :view do
  before(:each) do
    assign(:advisories, [
      Advisory.create!(),
      Advisory.create!()
    ])
  end

  it "renders a list of advisories" do
    render
  end
end
