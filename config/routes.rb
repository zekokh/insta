Insta::Application.routes.draw do
  root 'information_to_connects#index'


  resources :home, :information_to_connects, :stocks
  resources :sessions, only: [:new, :create, :destroy]

  #todo проработать action-ы контроллеров.
  # controller(:insta) {
  #  get '/signin' => :insta
  #  get '/key' => :get_key
  #  get '/code' => :index
  #}
end
