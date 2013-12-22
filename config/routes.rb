Anoside::Application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations', sessions: 'sessions' },
             path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  namespace :api do
    resources :comments, only: [] do
      delete :dislike, to: 'dislikes#comment_destroy'
      delete :like,    to: 'likes#comment_destroy'
      post   :dislike, to: 'dislikes#comment_create'
      post   :like,    to: 'likes#comment_create'
    end

    resource :discovery, only: [] do
      resources :posts, only: [] do
        get :popular, on: :collection
      end

      resources :tags, only: [] do
        get :popular, on: :collection
      end
    end

    resources :posts,      only: [:create, :destroy, :index, :show] do
      resources :comments, only: [:create, :index]
      resources :tags,     only: [:create, :index]

      delete :dislike, to: 'dislikes#post_destroy'
      delete :like,    to: 'likes#post_destroy'
      post   :dislike, to: 'dislikes#post_create'
      post   :like,    to: 'likes#post_create'
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

  namespace :discovery do
    resources :posts,    only: [:index]
    resources :tags,     only: [:index]

    root to: 'tags#index'
  end

  resource  :policies,   only: [] do
    collection do
      get :privacy
      get :terms
    end
  end
  resources :posts,      only: [:show]
  resource  :setting,    only: [:edit, :update]
  resources :tags,       only: [:show]
  resource  :timeline,   only: [:show]
  resource  :user,       only: [:show] do
    resources :dislikes, only: [:index], controller: 'user_dislikes'
    resources :likes,    only: [:index], controller: 'user_likes'
    resources :tags,     only: [:index], controller: 'user_tags'
  end

  root to: 'posts#index'
end
