Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users do
    resources :leads
  end
  resources :companies


  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get '/signout' => 'sessions#destroy'
  


end