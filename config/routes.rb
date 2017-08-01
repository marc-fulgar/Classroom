Rails.application.routes.draw do
  devise_for :students
  resources :students
  
  devise_for :teachers
  resources :teachers
  
  devise_for :subjects
  resources :subjects
  
  devise_for :block_classes
  resources :block_classes
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
