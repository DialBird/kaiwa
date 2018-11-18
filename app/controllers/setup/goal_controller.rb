# frozen_string_literal: true

class Setup::GoalController < ApplicationController
  include Template::Setup

  permits Goal::ATTRIBUTES, model_name: 'Goal'

  # TODO: newとcreateへ
  def edit
    super
    @goal = Goal.new(user_id: @user.id)
  end

  def update(goal)
    params[:goal][:user_id] = current_user.id
    @goal = Goal.new(goal)
    if @goal.save
      @user.update!(current_goal_id: @goal.id)
      @user.goal_settings_completed!
      flash[:success] = t('successes.messages.setup_completed')
      redirect_to root_path
    else
      Rails.logger.fatal(<<~LOG)
        Error @Setup::GoalController#update
        Fail to create goal
        MSG: #{@goal.errors.full_messages}
      LOG
      flash[:danger] = t('errors.messages.setup_failed')
      render :edit
    end
  end

  private

  def setup_context
    :goal
  end
end
