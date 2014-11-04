class LocationInterestsController < ApplicationController
  def index
    @location_interests = current_person.location_interests
  end

  def new
    @location_interest = current_person.location_interests.new
    @additional_locations = Location.all - current_person.locations
  end

  def build_location_and_interest
    current_person.locations.create!(:name => params[:location_interest][:location_name])
    redirect_to location_interests_path
  end

  def create
    current_person.location_interests.create!(:location_id => params[:location_interest][:location_id])
    redirect_to location_interests_path
  end

  def destroy
    current_person.location_interests.destroy(params[:id])
    redirect_to location_interests_path
  end
end
