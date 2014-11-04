class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Deject self, :user_repository

  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= user_repository.find session[:user_id]
    end
  end

  helper_method :current_person
  def current_person
    @current_person ||= find_or_create_person
  end

  private

  def find_or_create_person
    Person.where(:user_id => current_user.id).first || redirect_to(new_person_path)
  end

  def require_login
    current_user
  rescue Jsl::Identity::ResourceNotFound
    requested_url = Rack::Request.new(request.env).url
    redirect_to user_repository.login_url(requested_url)
  end

  def require_invitation_or_admin
    unless current_user && (current_user.invited? || current_user.admin?)
      render text:   'An invitation is required to visit this site',
             status: :forbidden
    end
  end
end
