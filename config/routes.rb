Rails.application.routes.draw do
  resources :acceptable_contact_roles
  resources :acceptable_contact_positions
  resources :acceptable_contact_salutations
  resources :contacts
  resources :contact_imports
  resources :schools
  resources :school_imports
  resources :districts
  resources :district_imports
  root 'dashboard#index'
end
