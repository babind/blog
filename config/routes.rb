Rails.application.routes.draw do

# match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
# match 'auth/failure', to: redirect('/'), via: [:get, :post]
# match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

# match '/auth/:provider/callback' => 'sessions#create'

match '/signout' => 'sessions#destroy', :as => :signout, via: [:get, :post]

match '/signin' => 'sessions#new', :as => :signin , via: [:get]
get  'auth/:provider/callback', to: 'sessions#create'


 root 'posts#index'
resources :posts
  resources :posts do 
  	resources :comments
  end
  
end
