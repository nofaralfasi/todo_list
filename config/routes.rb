Rails.application.routes.draw do
  root 'lists#index'

  resources :lists do
    member do
      get :delete
    end
  end

  resources :tasks do
    member do
      get :delete
    end
  end

  resources :labels do
    member do
      get :delete
    end
  end

end
