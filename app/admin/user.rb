ActiveAdmin.register User do
  actions :index
  permit_params :email, :password, :password_confirmation
  
  menu priority: 2

  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :email
    column :type
    column "Admin?", :is_admin
    actions
  end

  filter :type
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
