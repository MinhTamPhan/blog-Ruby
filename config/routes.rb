Rails.application.routes.draw do
<<<<<<< HEAD
  get 'welcome/index'
  
  
  resources :articles do
    resources :comments
  end
  
  root 'welcome#index'
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> 27138c7f9d47784945d3a213f2802b15048779bc
end
