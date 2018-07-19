Rails.application.routes.draw do

  get '/offers' => 'offers#index'
  get '/offers:id' => 'offers#show'
  post '/offers' => 'offers#create'
  # patch/put 'offers:id' => 'offers#update'
  delete 'offers:id' => 'offers#destroy'
  resources :offers

  get 'users/new'
  # resources: UsersController
      post '/login' => 'sessions#create'
      get '/logout' => 'sessions#destroy'
      post '/users' => 'users#create'
      get '/validate' => 'users#validate'

      match '*all' => "application#allow_options", via: :options, :constraints => { :all => /.*/ }
      resources :users
      resources :companies
      resources :offers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
