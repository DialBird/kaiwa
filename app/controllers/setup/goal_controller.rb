# frozen_string_literal: true

class Setup::GoalController < ApplicationController
  include Template::Setup

  # TODO: goalのnest

  private

  def setup_context
    :goal
  end
end
