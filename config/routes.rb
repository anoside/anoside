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

    resources :viewpoints, only: [:show]
  end

  resources :posts, only: [:show]
  resources :tags,  only: [:show]

  root to: 'posts#index'
end
