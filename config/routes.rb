Rails.application.routes.draw do
  get 'rooms/show'
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resources :rooms, only:[:create]
  end
  get 'users/:id/follows' => "users#follows", as: "follows"
  get 'users/:id/followers' => "users#followers", as: "followers"
  resources :books do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  post 'follow/:id' => "relationships#create", as: "follow"
  delete 'unfollow/:id' => "relationships#destroy", as: "unfollow"
  get 'search' => "search#action", as: "search"

  mount ActionCable.server => '/cable'

  get 'rooms' => 'rooms#index', as: "rooms"
  get 'room/:id' => 'rooms#show', as: "room"
  

end