Insta::Application.routes.draw do
  root 'information_to_connects#index'

  get '/get_token', to: 'token#get_token'
  get '/get_tags', to: 'tags#get_tags'
  resources :home, :information_to_connects, :stocks
  resources :sessions, only: [:new, :create, :destroy]

end
