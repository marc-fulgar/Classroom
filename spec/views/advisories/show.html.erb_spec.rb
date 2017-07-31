require 'rails_helper'

RSpec.describe "advisories/show", type: :view do
  before(:each) do
    @advisory = assign(:advisory, Advisory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
