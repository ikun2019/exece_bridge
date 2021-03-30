Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :engineers
  resources :cards, only: [:index, :new, :create, :destroy, :show, :edit, :update]

  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tops#index"

  resources :tops, only: [:index] do
    collection do
      get :engineers
    end
    get :engineer_show
  end


  resources :customers, only: [:index, :status, :edit, :update, :show] do
    member do
      get :status
    end
    collection do
      get :manual
    end
  end

  resources :requests, only: [:index, :new, :create, :show] do
    collection do
      get :completed
    end
    resources :agreements, only: [:new ,:create]
    resources :orders, only: [:create, :destroy]
    resources :completes, only: [:edit, :update]
  end

  resources :engineers, only: [:index, :edit, :update, :show] do
    member do
      get :apply
      get :replied
      get :completed
    end
    collection do
      get :manual
    end
    resources :ratings, only: [:new, :create, :show, :edit, :update, :index]
  end

  resources :questions, only: [:index, :new, :create, :show] do
    resources :answers, only: [:new, :create] do
      get :count
      get :countdown
    end
  end

  resources :trainings, only: [:index, :show]

end
