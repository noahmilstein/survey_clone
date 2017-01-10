Rails.application.routes.draw do
  devise_for :users
  resources :surveys do
    resources :questions
  end

  resources :questions do
    resources :possible_answers
    resources :user_answers
  end

  root 'surveys#index'
end
