Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :accounts
 
  match 'accounts/login', to: 'accounts#login', via: [:post]
  match '/logout', to: 'accounts#logout', via: [:get]
  match '/dashboard', to: 'articles#dashboard', via: [:get]
  match '/articles/search', to: 'articles#search', via: [:get]
  #match 'accounts/index', to: 'accounts#index', via: [:get]
  root 'articles#index'
end
