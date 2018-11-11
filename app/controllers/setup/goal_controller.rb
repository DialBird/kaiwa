# frozen_string_literal: true

class Setup::GoalController < ApplicationController
  include Template::Setup

  permits goals_attributes: Goal::ATTRIBUTES, model_name: 'User'

  def edit
    super
    @user.goals.build if @user.goals.empty?
  end

  private

  def setup_context
    :goal
  end
end
