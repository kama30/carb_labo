Rails.application.routes.draw do
  root  to: 'toppages#index'
  get 'test', to: 'toppages#test'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/:start_time/diets', to: 'diets#daily_index'
  get '/:start_time/diet', to: 'diets#daily_new'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]
  resources :diets
end
