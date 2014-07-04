Rails.application.routes.draw do 
  root 'dashboard#index'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users
  resources :contacts
  resources :contact_imports
  resources :schools
  resources :school_imports
  resources :districts
  resources :district_imports
  resources :acceptable_contact_roles
  resources :acceptable_contact_positions
  resources :acceptable_contact_salutations
  resources :file_imports
  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
end

