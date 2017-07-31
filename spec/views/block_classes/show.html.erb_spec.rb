require 'rails_helper'

RSpec.describe "block_classes/show", type: :view do
  before(:each) do
    @block_class = assign(:block_class, BlockClass.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
