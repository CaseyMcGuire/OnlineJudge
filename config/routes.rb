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
  get '/edit_problem/:id', to: 'problems#update', as: 'edit_problem'
  post '/get_new_language/:id', to: 'problems#get_new_language'

  #submissions controller
  post '/new/:id', to: 'submissions#new', as: 'new_submission'
  get '/check/:id', to: 'submissions#check', as: 'check'
end
