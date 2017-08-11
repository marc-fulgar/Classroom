Rails.application.routes.draw do
  devise_for :students
  resources :students
  
  devise_for :teachers
  resources :teachers
  
  devise_for :subjects
  resources :subjects
  
  devise_for :block_classes
  resources :block_classes
  
  devise_for :lectures
  resources :lectures
  
  devise_for :assignments
  resources :assignments
  
  devise_for :comments
  resources :comments
  
  devise_for :exam_schedules
  resources :exam_schedules
  
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#dashboard'

  get 'subjects/:id/lectures' => 'subjects#lectures', as: :subject_lectures
  get 'subjects/:id/assignments' => 'subjects#assignments', as: :subject_assignments
  get 'subjects/:id/exam_schedules' => 'subjects#exam_schedules', as: :subject_exam_schedules
  get 'block_classes/:id/destroy_subject' => 'block_classes#destroy_subject', as: :destroy_block_class_subject
  get 'subjects/:id/destroy_block_class' => 'subjects#destroy_block_class', as: :destroy_subject_block_class
  get '/dashboard' => 'users#dashboard', as: :dashboard
end
