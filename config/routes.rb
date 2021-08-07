Rails.application.routes.draw do
  resources :messages, only: [:index, :create, :destroy]
  mount_devise_token_auth_for 'User', at: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/list', to: "users#list"
end
