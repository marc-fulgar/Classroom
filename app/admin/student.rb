ActiveAdmin.register Student do
  permit_params :username, :first_name, :last_name, :year_level, :course, :email, :password, :password_confirmation
  
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
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :year_level
      f.input :course
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end