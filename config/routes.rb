Anoside::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' },
             path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  namespace :api do
    resources :posts, only: [:index, :create]
    resources :viewpoints, only: [:show]
  end

  root to: 'posts#index'
end
