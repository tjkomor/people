class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to dashboard_path
    else
      redirect_to '/auth/github'
    end
  end

  def create
    display_callback_info if Rails.env.production?

    if user.valid? && user.turing_member?
      Rails.logger.info('login succeeded! setting current user')

      @current_user          = user
      session[:current_user] = @current_user.as_json

      redirect_to dashboard_path
    else
      flash[:error] = 'Sorry, only members of the Turing github organization can do that.'
      redirect_to login_failure_path
    end
  end

  def failure
    Rails.logger.error("Oauth failed...#{params[:message]}")
    @failure_message = params[:message]
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_info
    {
      github_id:    auth.uid,
      github_token: auth.credentials.token,
      github_name:  auth.info.nickname,
      email:        auth.info.email
    }
  end

  def user
    TuringAuth::User.new(user_info)
  end

  def display_callback_info
    Rails.logger.info("Github Auth Callback received with user info #{user_info}")
    Rails.logger.info("TuringAuth::User validity: #{user.valid?}")
    Rails.logger.info("TuringAuth::User member?: #{user.turing_member?}")
  end
end
