Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#welcome'
  get '/about', to: 'home#about'
  get '/faq', to: 'home#faq'


  resources :problems, :tests, :results

  #submissions controller
  post '/submission', to: 'submissions#create'
  get '/submission/:id/check', to: 'submissions#check', as: 'check'
  get '/submissions/get_ungraded', to: 'submissions#get_ungraded'
  post '/submissions/update/:id', to: 'submissions#update'
  get '/submissions', to: 'submissions#index', as: 'submissions'
  get '/submissions/:id', to: 'submissions#show'

  post 'language', to: 'languages#get'
end
