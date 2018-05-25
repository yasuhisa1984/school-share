Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tops#index'
  devise_for :users
  resources :users, only: [:show]
  resources :schools,only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :posts, only:[:index, :new, :show, :create, :destroy]
end
