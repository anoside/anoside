Anoside::Application.routes.draw do
  devise_for :user,
    controllers: { registrations: 'users' },
    path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  resources :posts, only: [:create, :destroy, :index, :update] do
    resources :comments, only: [:create]
  end

  resource :user, only: [] do
    resource :preference, only: [:update]
  end

  root to: 'posts#index'
end
