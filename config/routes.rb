Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create, :destroy]
  end
  resources :bookings, only: [:index]
  resources :ratings, only: [:new, :create]
end
