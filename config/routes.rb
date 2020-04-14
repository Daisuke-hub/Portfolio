Rails.application.routes.draw do
  get 'user_relationships/create'
  get 'user_relationships/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root "abouts#top"
  resources :rooms, only: [:show, :index] do
    member do
      post :create
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update,] do
    resource :user_relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  get 'user_relationships/index'

  get "top", to: "abouts#top"

  mount ActionCable.server => "/cable"
end
