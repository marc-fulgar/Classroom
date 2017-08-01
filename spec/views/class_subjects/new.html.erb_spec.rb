require 'rails_helper'

RSpec.describe "class_subjects/new", type: :view do
  before(:each) do
    assign(:class_subject, ClassSubject.new())
  end

  it "renders new class_subject form" do
    render

    assert_select "form[action=?][method=?]", class_subjects_path, "post" do
    end
  end
end
