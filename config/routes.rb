Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/show'
  get 'friends/new'
  get 'friends/create'
  get 'friends/edit'
  get 'friends/update'
  get 'friends/destroy'
  get 'friends/add_listing'
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "friends#index"
  resources :friends
  get "friends/:id/add_listing", to: "friends#add_listing"
  get "homepage", to: "pages#home"
end
