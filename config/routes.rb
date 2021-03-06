Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :words
  resources :categories, only: [:index]
  resource :practice, only: [:new, :create]

  get "categories/:category_id/words" => "words#index", as: :category_words

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root "welcome#index"
end
