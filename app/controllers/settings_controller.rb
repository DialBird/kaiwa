# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :setup_user!
  permits User::ATTRIBUTES, model_name: 'User'

  def edit; end

  def update(user)
    if @user.update(user)
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
end
