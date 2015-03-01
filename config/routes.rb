Rails.application.routes.draw do

  devise_for :users

  #home
  root 'home#welcome'
  get '/about', to: 'home#about'
  get '/faq', to: 'home#faq'


  #problem page
  get '/problems', to: 'problems#menu'
  get '/problems/:id', to: 'problems#show', as: 'problem'
  post '/evaluate/:id', to: 'problems#evaluate', as: 'evaluate'
  get '/check/:id', to: 'problems#check', as: 'check'
  

end
