Rails.application.routes.draw do
  devise_for :users
  resources :questions
  resources :surveys
  resources :answers
  root 'surveys#index'
end
