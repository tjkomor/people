class DashboardsController < ApplicationController
  before_action :require_login
  before_action :require_invitation_or_admin

  def show
    @person = current_person
  end
end
