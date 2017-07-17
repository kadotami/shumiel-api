Rails.application.routes.draw do
  post 'auth_token' => 'auth_token#create'
  
  resources :users
  post 'signup', to: 'users#create'
  namespace :private do
    resources :interests
  end

  namespace :public do
    resources :interests
  end
end

