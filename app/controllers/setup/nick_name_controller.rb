# frozen_string_literal: true

class Setup::NickNameController < ApplicationController
  include Template::Setup

  permits :nick_name, model_name: 'User'

  private

  def setup_context
    :nick_name
  end
end
