Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [:index, :show, :new, :create]
  resources :rentals, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
