ActiveAdmin.register Student do
  permit_params :email, :password, :password_confirmation
  
  menu priority: 3, parent: 'Users'

  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :email
    column "Yr", :year_level
    column :course
    actions
  end

  filter :type
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :last_name, disabled: :true
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end