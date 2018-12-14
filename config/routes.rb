Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'homes', to: 'homes#show'
  root 'homes#show'
  resources :users, only: %i[show new edit create update destroy]
  resources :articles, only: %i[show new edit create update destroy]
end