class PreferencesController < InheritedResources::Base
  def update
    @preference = current_user.preference
    
    if @preference.update_attributes(params[:preference])
      redirect_to :back
    else
      render 'edit'
    end
  end
end
