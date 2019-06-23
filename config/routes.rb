Rails.application.routes.draw do
  root to:"profiles#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "user/:id", to: "users/registrations#detail"
    get "signup", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end
  resources :profiles
  resources :posts do
    resources :comments
  end
  get '/posts/hashtag/:name', to: 'posts#hashtag'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
