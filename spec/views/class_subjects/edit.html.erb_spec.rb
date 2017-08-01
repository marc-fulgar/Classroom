require 'rails_helper'

RSpec.describe "class_subjects/edit", type: :view do
  before(:each) do
    @class_subject = assign(:class_subject, ClassSubject.create!())
  end

  it "renders the edit class_subject form" do
    render

    assert_select "form[action=?][method=?]", class_subject_path(@class_subject), "post" do
    end
  end
end
