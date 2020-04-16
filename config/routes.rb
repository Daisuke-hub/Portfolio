Rails.application.routes.draw do
  get "top", to: "abouts#top"
  root "abouts#top"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update,] do
    resource :user_relationships, only: [:create, :destroy]
    resources :rooms, only: [:create]
  end
  resources :rooms, only: [:show, :index]  
  resources :user_relationships, only: [:index]

  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end