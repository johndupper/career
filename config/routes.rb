Rails.application.routes.draw do
  root 'jobs#index'
  get '/search', to: 'search#index'
  get '/search/results', to: 'search#results'
  resources :jobs
end
