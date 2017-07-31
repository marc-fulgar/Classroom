require 'rails_helper'

RSpec.describe "block_classes/index", type: :view do
  before(:each) do
    assign(:block_classes, [
      BlockClass.create!(),
      BlockClass.create!()
    ])
  end

  it "renders a list of block_classes" do
    render
  end
end
