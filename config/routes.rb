Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/delete'
  get 'users/edit'
  get 'users/update'
  get 'users/show'
  resources :movables do
    resources :bookings
  end
  devise_for :users
  root to: "pages#home"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
