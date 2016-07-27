Rails.application.routes.draw do

# match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
# 	# get  'auth/:provider/callback', to: 'sessions#create'
# match 'auth/failure', to: redirect('/'), via: [:get, :post]
# match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

match '/auth/:provider/callback' => 'sessions#create'

match '/signout' => 'sessions#destroy', :as => :signout

match '/signin' => 'sessions#new', :as => :signin

 root 'posts#index'
resources :posts
  resources :posts do 
  	resources :comments
  end
  
end
