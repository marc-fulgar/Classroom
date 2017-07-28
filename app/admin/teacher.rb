ActiveAdmin.register Teacher do
  permit_params :username, :first_name, :last_name, :email, :password, :password_confirmation
  
  menu priority: 5, parent: 'Users'

  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :email
    column "Admin?", :is_admin
    actions
  end

  filter :type
  filter :created_at

  form do |f|
    f.inputs do
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
