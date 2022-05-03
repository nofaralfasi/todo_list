Rails.application.routes.draw do
  root 'lists#index'

  resources :lists do
    resources :tasks
  end

  resources :labels do
    member do
      get :delete
    end
  end

end
