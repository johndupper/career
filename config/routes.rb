Rails.application.routes.draw do
  root 'jobs#index'
  resources :jobs
  get '/search', to: 'search#index'
  post '/search', to: 'search#results'
end
