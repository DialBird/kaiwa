# frozen_string_literal: true

class ActionsController < ApplicationController
  before_action :setup_user!
  before_action :setup_action!, only: %i[show edit update destroy]
  layout 'narrow'
  # NOTE: Actionはすでに先約のパラメーターが入っているため、ちょっと名前を変える必要がある
  permits Action::ATTRIBUTES, model_name: 'Aktion'

  def show; end

  def new
    @action = Action.new
  end

  def create(aktion)
    params[:aktion][:goal_id] = @user.current_goal.id
    @action = Action.new(aktion)
    if @action.save
      flash[:success] = t('successes.messages.created', model: 'アクション')
      redirect_to dashboard_path
    else
      flash[:danger] = t('errors.messages.created', model: 'アクション')
      Rails.logger.fatal(<<~LOG)
        Error @ActionsController#create
        Fail to create action
        MSG: #{@action.errors.full_messages}
      LOG
      render :new
    end
  end

  def edit; end

  def update(aktion)
    if @action.update(aktion)
      flash[:success] = t('successes.messages.updated', model: 'アクション')
      redirect_to dashboard_path
    else
      flash[:danger] = t('errors.messages.update', model: 'アクション')
      Rails.logger.fatal(<<~LOG)
        Error @ActionsController#update
        Fail to update action
        MSG: #{@action.errors.full_messages}
      LOG
      render :edit
    end
  end

  def destroy
    @action.destroy
    flash[:success] = t('successes.messages.deleted', model: 'イベント')
    redirect_to dashboard_path
  end

  private

  def setup_user!
    @user = current_user
  end

  def setup_action!(id)
    @action = Action.find(id)
  end
end
