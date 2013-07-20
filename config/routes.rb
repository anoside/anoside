Anoside::Application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users' },
    path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  namespace :api do
    resources :comments, only: [:index]
    resources :posts, only: [:index, :create, :destroy] do
      resources :comments, only: [:create]
      resources :tags, only: [:create]
    end
    resources :tags, only: [:index]
  end

  resources :posts, only: [:index]

  resource :user, only: [] do
    resource :preference, only: [:update]
  end

  root to: 'posts#index'
end
