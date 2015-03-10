Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#welcome'
  get '/about', to: 'home#about'
  get '/faq', to: 'home#faq'


  resources :problems, :tests

  #submissions controller
  post '/submission', to: 'submissions#create'
  get '/submission/:id/check', to: 'submissions#check', as: 'check'
  get '/submission/get_ungraded', to: 'submissions#get_ungraded'
  post '/submission/update/:id', to: 'submissions#update'

  post 'language', to: 'languages#get'
end
