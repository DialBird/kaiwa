# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :setup_goal!, only: %i[show edit update destroy]
  layout 'narrow'
  permits Goal::ATTRIBUTES, model_name: 'Goal'

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create(goal)
    params[:goal][:user_id] = current_user.id
    @goal = Goal.new(goal)
    if @goal.save
      flash[:success] = t('successes.messages.created', model: '目標')
      redirect_to user_goals_path
    else
      flash[:danger] = t('errors.messages.created', model: '目標')
      Rails.logger.fatal(<<~LOG)
        Error @GoalsController#create
        Fail to create goal
        MSG: #{@goal.errors.full_messages}
      LOG
      render :new
    end
  end

  def edit; end

  def update(goal)
    if @goal.update(goal)
      @goal.user.update(current_goal_id: @goal.id) if params[:set_to_current_goal]
      flash[:success] = t('successes.messages.updated', model: '目標')
      redirect_to user_goals_path
    else
      flash[:danger] = t('errors.messages.update', model: '目標')
      Rails.logger.fatal(<<~LOG)
        Error @GoalsController#update
        Fail to update goal
        MSG: #{@goal.errors.full_messages}
      LOG
      render :edit
    end
  end

  def destroy
    if @goal.destroy
      flash[:success] = t('successes.messages.deleted', model: '目標')
    else
      flash[:danger] = t('errors.messages.current_goal_cant_be_removed')
    end
    redirect_to user_goals_path
  end

  private

  def setup_goal!(id)
    @goal = Goal.find(id)
    raise t('errors.messages.not_your_own_data') if @goal.user != current_user
  end
end
