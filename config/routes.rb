Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :subscriptions, only: [:index, :create, :destroy]

  root "welcome#index"
  get "my_portfolio", to: "users#my_portfolio"
  get "search_stocks", to: "stocks#search"
  get "search_users", to: "users#search"
end
