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

  resources :activities do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :edit, :update, :index]

end
