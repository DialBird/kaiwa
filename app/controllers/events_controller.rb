# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :setup_user!
  before_action :setup_event!, only: %i[show edit update destroy]
  layout 'narrow'
  permits Event::ATTRIBUTES, plans_attributes: :title

  def index
    @events = @user.current_goal.events
  end

  def show; end

  def new
    @event = Event.new
    @event.plans.build
  end

  def create(event)
    params[:event][:goal_id] = @user.current_goal.id
    @event = Event.new(event)
    if @event.save
      flash[:success] = t('successes.messages.created', model: 'イベント')
      redirect_to dashboard_path
    else
      flash[:danger] = t('errors.messages.created', model: 'イベント')
      Rails.logger.fatal(<<~LOG)
        Error @EventsController#create
        Fail to create event
        MSG: #{@event.errors.full_messages}
      LOG
      render :new
    end
  end

  def edit; end

  def update(event)
    if @event.update(event)
      flash[:success] = t('successes.messages.updated', model: 'イベント')
      redirect_to user_events_path
    else
      flash[:danger] = t('errors.messages.update', model: 'イベント')
      Rails.logger.fatal(<<~LOG)
        Error @HabitsController#update
        Fail to update event
        MSG: #{@event.errors.full_messages}
      LOG
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:success] = t('successes.messages.deleted', model: 'イベント')
    redirect_to user_events_path
  end

  private

  def setup_user!
    @user = current_user
  end

  def setup_event!(id)
    @event = Event.find(id)
    raise t('errors.messages.not_your_own_data') if @event.goal.user != @user
  end
end
