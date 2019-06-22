Rails.application.routes.draw do
  get 'profiles/index'
  get 'profiles/new'
  get 'profiles/show'
  get 'profiles/edit'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
