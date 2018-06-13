Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tops#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users, only: %i[show]

  resources :schools, only: %i[index show] do
    resources :posts, only: %i[index new show create destroy edit update], module: 'schools'
    collection do
      get :search
    end
  end

  resources :posts, only: %i[index new show create destroy] do
    resources :scores, only: %i[new create destroy edit]
    collection do
      get :search
      get :search_post
    end
  end

  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
