# frozen_string_literal: true

class EventsController < ApplicationController
  class NotOwnEventError < StandardError; end

  before_action :setup_event!, only: %i[show edit update destroy]
  layout 'narrow'
  permits Event::ATTRIBUTES

  def index
    @events = current_user.events
  end

  def show; end

  def new
    @event = Event.new(user_id: current_user.id)
  end

  def create(event)
    @event = Event.new(event)
    if @event.save
      flash[:success] = t('successes.messages.created', model: 'イベント')
      redirect_to user_events_path
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

  def setup_event!(id)
    @event = Event.find(id)
    raise NotOwnEventError if @event.user != current_user
  end
end
