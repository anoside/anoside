class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!, only: [:update_to_normal_user]
  before_filter only: [:edit, :update] do
    @user = current_user
    @preference = current_user.preference
  end
end
