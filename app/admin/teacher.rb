ActiveAdmin.register Teacher do
  actions :all, except: :new
  permit_params :username, :first_name, :last_name, :email, :password, :password_confirmation
  
  menu priority: 5, parent: 'Users'
  
  action_item only: :index do
    link_to 'Create Teacher', new_teacher_path
  end
  
  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :email
    column "Admin?", :is_admin
    actions
  end
  
  filter :created_at
  filter :block_class_name

  form do |f|
    f.inputs do
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :advisory
    end
    f.actions
  end
end
