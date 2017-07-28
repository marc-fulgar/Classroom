Rails.application.routes.draw do
  devise_for :students
  resources :students
  
  devise_for :teachers
  resources :teachers
  
  devise_for :subjects
  resources :subjects
  
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/dashboard#index'
end
