Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create, :destroy]
  end
  resources :bookings, only: [:index]
  resources :ratings, only: [:new, :create]

  # get 'bookings/', to: 'bookings#index'
  # get 'bookings/cars/:id/:car_id', to: 'bookings#b_index_car'
  # get 'bookings/:user_id' to: 'bookings#b_index_user'
  # get 'bookings/:owner_id/' to: 'bookings#b_index_owner'
  # # get 'photos/:id/:user_id', to: 'photos#show'


end
