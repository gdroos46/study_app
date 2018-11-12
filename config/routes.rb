Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'homes', to: 'homes#show'
  root 'users#index'
  resources :users, only: %i[show new edit create update destroy]
end