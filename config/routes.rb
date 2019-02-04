Rails.application.routes.draw do
  
  #for user side
  get 'dashboard/index'
  resources :order_line_items
  resources :businesses
  resources :products
  resources :orders
  resources :customers
  resources :activity_details
  resources :work_details
  resources :employees
  root to: 'dashboard#index'

  # for admin side
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
