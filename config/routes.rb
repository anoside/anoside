Anoside::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' },
             path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  namespace :api do
    resources :posts, only: [:index, :create, :destroy] do
      resources :comments, only: [:index, :create]
    end
    resources :viewpoints, only: [:show]
  end

  root to: 'posts#index'
end
