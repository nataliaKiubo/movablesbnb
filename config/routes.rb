Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  get 'users/show'
  resources :movables
  devise_for :users
  root to: "pages#home"
  resources :users
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
