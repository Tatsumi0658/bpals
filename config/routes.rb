Rails.application.routes.draw do
  root to:"profiles#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :profiles
  resources :posts
  get '/posts/hashtag/:name', to: 'posts#hashtag'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
