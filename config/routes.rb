Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :words
  resource :practice, only: [:new, :create]

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root "welcome#index"
end
