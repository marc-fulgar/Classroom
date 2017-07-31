require 'rails_helper'

RSpec.describe "block_classes/edit", type: :view do
  before(:each) do
    @block_class = assign(:block_class, BlockClass.create!())
  end

  it "renders the edit block_class form" do
    render

    assert_select "form[action=?][method=?]", block_class_path(@block_class), "post" do
    end
  end
end
