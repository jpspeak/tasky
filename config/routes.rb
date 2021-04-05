Rails.application.routes.draw do
  
  devise_for :users

  root to: 'pages#welcome'

  get '/home', to: 'home#index'

end
