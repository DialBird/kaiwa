# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :aasm_state_completed?

  def index; end
end
