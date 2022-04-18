Rails.application.routes.draw do
  get 'lists/index'
  get 'labels/index'
  get 'tasks/index'

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

end
