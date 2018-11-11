# frozen_string_literal: true

class AasmHubController < ApplicationController
  skip_before_action :aasm_state_completed?

  def index
    return redirect_to root_path if current_user.settings_completed?

    case current_user.aasm_state
    when 'nick_name_settings_required'
      redirect_to setup_nick_name_path
    when 'goal_settings_required'
      redirect_to setup_goal_path
    end
  end
end
