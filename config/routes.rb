Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :index
  resources :users, only: [:show, :edit, :update]

  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
