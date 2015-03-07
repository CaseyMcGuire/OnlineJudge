Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#welcome'
  get '/about', to: 'home#about'
  get '/faq', to: 'home#faq'


  #problem controller
  get '/problems', to: 'problems#menu'
  get '/problems/:id', to: 'problems#show', as: 'problem'
#  post '/evaluate/:id', to: 'problems#evaluate', as: 'evaluate'
  #  get '/check/:id', to: 'problems#check', as: 'check'
  get '/problems/edit/:id', to: 'problems#update', as: 'edit_problem'
  

  #submissions controller
  post '/new/:id', to: 'submissions#new', as: 'new_submission'
  get '/check/:id', to: 'submissions#check', as: 'check'
  get '/submissions/get_ungraded', to: 'submissions#get_ungraded'
  post '/submissions/update/:id', to: 'submissions#update'
end
