class ApplicationController < ActionController::Base
  include TuringAuth::CurrentUser
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  helper_method :current_person
  def current_person
    @current_person ||= find_or_create_person
  end

  private

  def find_or_create_person
    Person.where(:user_github_id => current_user.github_id).first || redirect_to(new_person_path)
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
