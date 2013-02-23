class PreferencesController < ApplicationController
  before_filter :authenticate_user!, only: [:update]

  def update
    @preference = current_user.preference
    
    if @preference.update_attributes(params[:preference])
      redirect_to edit_user_registration_path
    else
      render 'edit'
    end
  end
end
