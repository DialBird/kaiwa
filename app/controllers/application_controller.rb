# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :aasm_state_completed?, unless: :devise_controller?

  private

  def aasm_state_completed?
    return true if current_user&.settings_completed?

    redirect_to aasm_hub_path
  end
end
