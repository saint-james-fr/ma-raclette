Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :raclettes do
    resources :bookings, except: [:destroy]
  end

  resources :bookings, only: [] do
    resources :reviews, except: [:destroy]
  end
end
