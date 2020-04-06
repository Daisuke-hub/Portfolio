Rails.application.routes.draw do
  devise_for :users
  root "abouts#top"
  resources :rooms, only: [:show, :index] do
    member do
      post :create
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  get "about", to: "abouts#about"
  get "top", to: "abouts#top"

  mount ActionCable.server => "/cable"
end
