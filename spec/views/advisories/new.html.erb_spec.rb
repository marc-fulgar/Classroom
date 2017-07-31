require 'rails_helper'

RSpec.describe "advisories/new", type: :view do
  before(:each) do
    assign(:advisory, Advisory.new())
  end

  it "renders new advisory form" do
    render

    assert_select "form[action=?][method=?]", advisories_path, "post" do
    end
  end
end
