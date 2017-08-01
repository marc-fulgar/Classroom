require 'rails_helper'

RSpec.describe "class_subjects/show", type: :view do
  before(:each) do
    @class_subject = assign(:class_subject, ClassSubject.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
