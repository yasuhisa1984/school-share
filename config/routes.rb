Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tops#index'
  devise_for :users
  resources :users, only: [:show]

  resources :schools,only: [:index, :show] do
    resources :posts, only:[:index, :new, :show, :create, :destroy], module: 'schools'
    collection do
      get :search
    end
  end

  resources :posts, only:[:index, :new, :show, :create, :destroy] do
    collection do
      get :search
      get :search_post
    end
  end
end
