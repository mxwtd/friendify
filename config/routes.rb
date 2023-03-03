Rails.application.routes.draw do
  get 'activities/index'
  get 'activities/show'
  get 'activities/new'
  get 'activities/create'
  get 'activities/edit'
  get 'activities/update'
  get 'activities/destroy'
  get 'activities/add_listing'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: "activities#index"
  resources :activities do
    resources :bookings
  end
  get "activities/:id/add_listing", to: "activities#add_listing"
  # get "homepage", to: "pages#home"
  get "bookings", to: "bookings#bookings_list"
end
