Rails.application.routes.draw do
  resources :order_line_items
  resources :businesses
  resources :products
  resources :orders
  resources :customers
  resources :activity_details
  resources :work_details
  resources :employees
  root to: 'employees#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
