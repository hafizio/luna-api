Rails.application.routes.draw do
  resources :conversations, defaults: { format: :json }
end
