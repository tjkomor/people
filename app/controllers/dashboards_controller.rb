class DashboardsController < ApplicationController
  before_action :require_login

  def show
    @person = current_person
  end
end
