Rails.application.routes.draw do

  resources :users, except: [:new]
  get 'signup', to:'users#new'
  


  resources :articles
  root 'pages#home'
  get 'about', to:'pages#about'

  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy'

  resources :categories, except: [:destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
