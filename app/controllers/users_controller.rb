class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!, only: [:update_to_normal_user]
  before_filter only: [:edit, :update] do
    @user = current_user
    @preference = current_user.preference
  end

  def create_guest_user
    guest_user = User.new_guest
    guest_user.accept_language_id = session[:accept_language_id]

    if guest_user.save
      sign_in_and_redirect(guest_user)
    end
  end

  def update_to_normal_user
    user = current_user
    user.attributes = params[:user]

    if user.valid?
      sign_out(current_user)

      return sign_in_and_redirect(user)
    end

    current_user.guest = true
    render 'edit'
  end
end
