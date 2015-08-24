Insta::Application.routes.draw do
  root 'information_to_connects#index'

  get '/get_token', to: 'token#get_token'
  get '/get_tags', to: 'tags#get_tags'
  get '/members', to: 'members#get_members'
  get '/members_true', to: 'members#member_true'
  get '/members_false', to: 'members#member_false'
  get '/member/:id', to: 'members#show'
  get '/change/:id', to: 'member#change_dispaly_status'

  resources :home, :information_to_connects, :stocks
  resources :sessions, only: [:new, :create, :destroy]

end
