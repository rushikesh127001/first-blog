Rails.application.routes.draw do
  get 'signup', to:'users#new'
  post 'users', to:'users#create'
  resources :articles
  root 'pages#home'
  get 'about', to:'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
