Rails.application.routes.draw do
  resources :ejs
  resources :careers
  resources :universities
  resources :students

    post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
