class SettingsController < ApplicationController
  def edit
    @setting = current_user.setting
  end

  def update
    @setting = current_user.setting

    if @setting.update_attributes(setting_params)
      flash[:notice] = t('messages.settings_have_been_saved')
      redirect_to edit_setting_path
    else
      render 'edit'
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:email, :email_when_commented)
  end
end
