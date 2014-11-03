class DashboardsController < ApplicationController
  def show
    @person = current_person
  end
end
