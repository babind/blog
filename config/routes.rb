Rails.application.routes.draw do

match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

# get 'auth/:provider/callback', to: 'users#create'
# # match 'auth/:provider/callback', to: 'sessions#create'

# get 'auth/failure', to: redirect('/')
# get 'signout', to: 'sessions#destroy', as: 'signout'

 root 'posts#index'
resources :posts
  resources :posts do 
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
