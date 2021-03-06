Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get 'garage', to: "cars#garage"
    end

    member do
      get :toggle, to: "cars#rental_toggle", as: :toggle
    end

    resources :bookings, only: [:create, :destroy]
  end
  resources :bookings, only: [:index] do
    collection do
      get 'garage_bookings', to: "bookings#garage_bookings"
    end
  end
  resources :ratings, only: [:new, :create]
end
