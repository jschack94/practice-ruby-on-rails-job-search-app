Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users do
    resources :leads
  end
  resources :companies


  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#create_oath'

  get '/web_dev' => 'leads#web_dev'

  get '/search' => 'leads#search'

end