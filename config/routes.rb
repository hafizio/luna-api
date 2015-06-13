Rails.application.routes.draw do
  resources :conversations, defaults: { format: :json }
  resources :users, defaults: { format: :json }
end
