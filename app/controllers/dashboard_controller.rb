# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :setup_user!

  def index; end

  private

  def setup_user!
    @user = current_user
  end
end
