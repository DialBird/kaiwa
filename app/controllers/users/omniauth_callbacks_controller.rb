# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      Rails.logger.fatal(<<~LOG)
        Error @Users::OmniauthCallbacksController#facebook
        Fail to signup
        MSG: #{@user.errors.full_messages}
      LOG
      flash[:error] = t('errors.messages.signup')
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
