Anoside::Application.routes.draw do
  devise_for :users,
    path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  resources :posts, only: [:create, :destroy, :index, :update] do
    resources :comments, only: [:create]
  end

  root to: 'posts#index'
end
