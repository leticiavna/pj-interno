Rails.application.routes.draw do
  resources :ejs
  resources :careers
  resources :universities
  resources :students

 post 'authenticate', to: 'authentication#authenticate'
#   post 'auth/login', to: 'authentication#authenticate'
#   post 'signup', to: 'students#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
