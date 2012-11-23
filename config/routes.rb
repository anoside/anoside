Anoside::Application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users' },
    path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  devise_scope :user do
    post 'users/create_guest_user', as: 'create_guest_users'
    put 'users/update_to_normal_user', as: 'update_to_normal_users'
  end

  resources :posts, only: [:create, :destroy, :index, :update] do
    resources :comments, only: [:create]
  end

  resource :user, only: [] do
    resource :preference, only: [:update]
  end

  root to: 'posts#index'
end
