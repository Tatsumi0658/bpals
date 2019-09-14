Rails.application.routes.draw do
  #get 'oauth/index'
  root to:'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
  }
  devise_scope :user do
    get "user/:id", to: "users/registrations#detail"
    get "signup", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end
  resources :users do
    collection do
      get 'search', to: 'users#search'
    end
  end
  resources :profiles do
    collection do
      get 'search', to: 'profiles#search'
    end
  end
  resources :posts do
    resources :post_comments, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]
    collection do
      get 'search', to: 'posts#search'
      get 'hashtag/:name', to: 'posts#hashtag'
    end
  end

  resources :products do
    resources :product_comments, only:[:create, :destroy]
    collection do
      get 'search', to: 'products#search'
    end
  end

  get 'pages/about'
  get 'pages/privacy'
  get 'pages/service'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
