require 'rails_helper'

RSpec.describe "class_subjects/index", type: :view do
  before(:each) do
    assign(:class_subjects, [
      ClassSubject.create!(),
      ClassSubject.create!()
    ])
  end

  it "renders a list of class_subjects" do
    render
  end
end
