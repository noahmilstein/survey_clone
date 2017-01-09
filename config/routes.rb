Rails.application.routes.draw do
  resources :surveys do
    resources :questions
  end
  root 'survey#index'
end
