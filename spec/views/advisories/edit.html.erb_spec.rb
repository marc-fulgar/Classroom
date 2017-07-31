require 'rails_helper'

RSpec.describe "advisories/edit", type: :view do
  before(:each) do
    @advisory = assign(:advisory, Advisory.create!())
  end

  it "renders the edit advisory form" do
    render

    assert_select "form[action=?][method=?]", advisory_path(@advisory), "post" do
    end
  end
end
