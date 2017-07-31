require 'rails_helper'

RSpec.describe "block_classes/new", type: :view do
  before(:each) do
    assign(:block_class, BlockClass.new())
  end

  it "renders new block_class form" do
    render

    assert_select "form[action=?][method=?]", block_classes_path, "post" do
    end
  end
end
