# frozen_string_literal: true

module Template::Setup
  extend ActiveSupport::Concern

  included do
    skip_before_action :aasm_state_completed?
    before_action :setup_user!
    layout 'narrow'
  end

  def edit
    redirect_to aasm_hub_path unless @user.send("#{setup_context}_settings_required?")
  end

  def update(user)
    @user.attributes = user
    if @user.save(context: setup_context)
      @user.send("#{setup_context}_settings_completed!")
      flash[:success] = t('successes.messages.setup_completed') if @user.settings_completed?
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def setup_user!
    @user = current_user
  end

  def setup_context
    raise NotImplementedError
  end
end
