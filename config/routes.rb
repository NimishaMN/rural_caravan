Rails.application.routes.draw do
  
  resources :vendors
  resources :subscriptions
  get 'expenses/populate_other_list'
  resources :expenses
  # devise_for :users

  # devise_for :users, controllers: {registrations: 'users/registrations'}, path_names: { sign_in: 'login',
  #   sign_out: 'logout', password: 'secret', confirmation: 'verification',
  #   unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, as: ''

  devise_for :users, :skip => [:sessions]
    as :user do
  get 'sign-in' => 'devise/sessions#new', :as => :new_user_session
  post 'sign-in' => 'devise/sessions#create', :as => :user_session
  delete 'sign-out' => 'devise/sessions#destroy', :as => :destroy_user_session
end
  resources :billings
  #for user side
  get 'dashboard/index'
  resources :order_line_items
  resources :businesses
  resources :products
  get "orders/remove_line_item"
  get "orders/add_row"
  resources :orders
  resources :customers
  post 'activity_details/status'
  resources :activity_details
  resources :work_details
  resources :employees
  # root to: 'users/login'

  devise_scope :user do
  root to: "devise/sessions#new"
end

  # for admin side
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
