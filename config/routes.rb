Rails.application.routes.draw do
  post 'auth_token' => 'auth_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  post 'signup', to: 'users#create'
end

