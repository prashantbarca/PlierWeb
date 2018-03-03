Rails.application.routes.draw do
  resources :newattachments
  root to: 'visitors#index'
end
