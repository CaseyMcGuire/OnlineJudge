Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#welcome'
  get '/about', to: 'home#about'
  get '/faq', to: 'home#faq'


  resources :problems, :tests, :results, :languages, :statuses
  
  get 'test/find', to: 'tests#find', as: 'find_test'

  #submissions controller
  post '/submission', to: 'submissions#create'
  get '/submission/:id/check', to: 'submissions#check', as: 'check'
  get '/submissions/get_ungraded', to: 'submissions#get_ungraded'
  post '/submissions/update/:id', to: 'submissions#update'
  get '/submissions', to: 'submissions#index', as: 'submissions'
  get '/submissions/:id', to: 'submissions#show'

  get '/profiles/:id', to: 'profiles#show', as: 'profiles'

 # post 'language', to: 'languages#get'
end
