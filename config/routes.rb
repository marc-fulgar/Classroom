Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

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
  
  devise_for :exams
  resources :exams
  
  devise_for :courses
  resources :courses
  
  devise_for :users
  resources :users do
    collection do
      put :mark_as_read
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'subjects/:id/lectures' => 'subjects#lectures', as: :subject_lectures
  get 'subjects/:id/assignments' => 'subjects#assignments', as: :subject_assignments
  get 'subjects/:id/exam_schedules' => 'subjects#exam_schedules', as: :subject_exam_schedules
  get 'exam_schedules/:id/exam_index' => 'exam_schedules#exam_index', as: :exam_schedule_exam_index
  get 'block_classes/:id/destroy_subject' => 'block_classes#destroy_subject', as: :destroy_block_class_subject
  get 'subjects/:id/destroy_block_class' => 'subjects#destroy_block_class', as: :destroy_subject_block_class
  get '/dashboard' => 'users#dashboard', as: :dashboard

  # match "/404", :to => "errors#not_found", via: :all
  # match "/500", :to => "errors#internal_server_error", via: :all

  root 'users#dashboard'
end
