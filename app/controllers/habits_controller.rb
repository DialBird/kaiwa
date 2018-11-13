# frozen_string_literal: true

class HabitsController < ApplicationController
  class NotOwnHabitError < StandardError; end

  before_action :setup_habit!, only: %i[show edit update destroy]
  layout 'narrow'
  permits Habit::ATTRIBUTES

  def show; end

  def new
    @habit = Habit.new(user_id: current_user.id)
  end

  def create(habit)
    @habit = Habit.new(habit)
    if @habit.save
      flash[:success] = t('successes.messages.created', model: '自分の癖')
      redirect_to root_path
    else
      flash[:danger] = t('errors.messages.created', model: '自分の癖')
      Rails.logger.fatal(<<~LOG)
        Error @HabitsController#create
        Fail to create habit
        MSG: #{@habit.errors.full_messages}
      LOG
      render :new
    end
  end

  def edit; end

  def update(habit)
    if @habit.update(habit)
      flash[:success] = t('successes.messages.updated', model: '自分の癖')
      redirect_to root_path
    else
      flash[:danger] = t('errors.messages.update', model: '自分の癖')
      Rails.logger.fatal(<<~LOG)
        Error @HabitsController#update
        Fail to update habit
        MSG: #{@habit.errors.full_messages}
      LOG
      render :edit
    end
  end

  def destroy
    @habit.destroy
    flash[:success] = t('successes.messages.deleted', model: '自分の癖')
    redirect_to root_path
  end

  private

  def setup_habit!(id)
    @habit = Habit.find(id)
    raise NotOwnHabitError if @habit.user != current_user
  end
end
