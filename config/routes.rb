Anoside::Application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users' },
    path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  devise_scope :user do
    post 'users/create_guest_user', as: 'create_guest_users'
    put 'users/update_to_normal_user', as: 'update_to_normal_users'
  end

  namespace :api do
    resources :posts, only: [:index, :create] do
      resources :comments, only: [:index, :create]
      resources :tags, only: [:create]
    end
  end

  resources :posts, only: [:index]

  resource :user, only: [] do
    resource :preference, only: [:update]
  end

  root to: 'posts#index'
end
