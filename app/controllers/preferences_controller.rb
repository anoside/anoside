class PreferencesController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:update]

  def update
    @preference = current_user.preference
    
    if @preference.update_attributes(params[:preference])
      redirect_to :back
    else
      render 'edit'
    end
  end
end
