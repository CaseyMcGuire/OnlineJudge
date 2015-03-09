Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#welcome'
  get '/about', to: 'home#about'
  get '/faq', to: 'home#faq'


  resources :problems, :tests
  #problem controller
  #get '/problems', to: 'problems#index'
  #get '/problems/:id', to: 'problems#show', as: 'problem'
  #  post '/evaluate/:id', to: 'problems#evaluate', as: 'evaluate'
  #  get '/check/:id', to: 'problems#check', as: 'check'
  #get '/problems/:id/edit', to: 'problems#update', as: 'edit_problem'
  

  #submissions controller
  post '/submissions/new/:id', to: 'submissions#new', as: 'new_submission'
  get '/submissions/check/:id', to: 'submissions#check', as: 'check'
  get '/submissions/get_ungraded', to: 'submissions#get_ungraded'
  post '/submissions/update/:id', to: 'submissions#update'
end
