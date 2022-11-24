Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :raclettes do
    resources :bookings, except: [:destroy]
  end

  resources :bookings, only: [] do
    resources :reviews, except: [:destroy]
  end
end
