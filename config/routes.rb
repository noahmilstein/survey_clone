Rails.application.routes.draw do
  resources :surveys do
    resources :questions do
      resources :possible_answers
      resources :user_answers
    end
  end
  root 'survey#index'
end
