Rails.application.routes.draw do
  root  to: 'toppages#index'
  get 'test', to: 'toppages#test'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/:start_time/diets', to: 'diets#daily_index'
  get '/:start_time/diet', to: 'diets#daily_new'
  get '/twitter/index', to: 'twitter#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update] do
    member do
      get :weekly_records
      get :monthly_records
      get :yearly_records
    end
  end
  resources :diets
end
