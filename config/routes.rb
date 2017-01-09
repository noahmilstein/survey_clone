Rails.application.routes.draw do
  resources :surveys
  root 'survey#index'
end
