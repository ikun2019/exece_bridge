Rails.application.routes.draw do
  devise_for :engineers
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tops#index"

  resources :tops, only: [:index]
  resources :customers
  resources :requests, only: [:index, :new, :create, :show] do
    resources :orders, only: [:create, :destroy]
  end
  resources :engineers, only: [:index, :show] do
    member do
      get :apply
    end
  end
end
