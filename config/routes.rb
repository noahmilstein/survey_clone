Rails.application.routes.draw do
  root 'surveys#home'

  devise_for :users

  resources :answers

  resources :questions

  resources :surveys do
    resources :submissions
  end

  get '/home', to: 'surveys#home'
  get '/mysurveys', to: 'surveys#mysurveys'
end
