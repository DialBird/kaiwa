# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :setup_user!

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t('successes.messages.settings_update')
      redirect_to settings_path
    else
      flash.now[:error] = t('errors.messages.settings_update')
      render :edit
    end
  end

  private

  def setup_user!
    @user = current_user
  end

  def user_params
    params.require(:user).permit(User::ATTRIBUTES)
  end
end
