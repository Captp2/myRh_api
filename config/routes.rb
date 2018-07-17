Rails.application.routes.draw do
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
