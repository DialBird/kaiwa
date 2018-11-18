# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @user = current_user
    @goal = @user.current_goal
  end
end
