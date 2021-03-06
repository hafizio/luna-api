Rails.application.routes.draw do
  root to: 'conversations#index'
  resources :conversations, defaults: { format: :json }
  resources :messages, defaults: { format: :json }
  resources :users, except: [:show], defaults: { format: :json }
  get 'users/*slug', to: 'users#show'
end
