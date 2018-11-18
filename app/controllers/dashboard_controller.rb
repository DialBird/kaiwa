# frozen_string_literal: true

class DashboardController < ApplicationController
  permits :current_goal_id, model_name: 'User'

  def index(user = nil)
    @user = current_user
    @user.update(user) if user
    @goal = @user.current_goal
  end
end
