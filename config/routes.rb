Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :words, only: [:index, :show, :destroy]

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root "welcome#index"
end
