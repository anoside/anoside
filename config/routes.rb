Anoside::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' },
             path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  namespace :api do
    resources :posts,      only: [:create, :destroy, :index, :show] do
      resource  :dislike,  only: [:create, :destroy]
      resource  :like,     only: [:create, :destroy]
      resources :comments, only: [:create, :index]
      resources :tags,     only: [:create, :index]
    end

    resources :tags,       only: [:show] do
      resource :follow,    only: [:create, :destroy]
    end

    resource :user,        only: [] do
      resources :dislikes, only: [:index], controller: 'user_dislikes'
      resources :likes,    only: [:index], controller: 'user_likes'
      resources :posts,    only: [:index], controller: 'user_posts'
      resources :tags,     only: [:index], controller: 'user_tags'
    end

    resources :viewpoints, only: [:show]
  end

  resources :posts,      only: [:show]
  resource  :setting,    only: [:edit, :update]
  resources :tags,       only: [:show]
  resource  :user,       only: [:show] do
    resources :dislikes, only: [:index], controller: 'user_dislikes'
    resources :likes,    only: [:index], controller: 'user_likes'
    resources :tags,     only: [:index], controller: 'user_tags'
  end

  root to: 'posts#index'
end
