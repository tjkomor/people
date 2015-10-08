class LocationInterestsController < ApplicationController
  def index
    @location_interests = current_person.location_interests
  end

  def new
    @location_interest    = current_person.location_interests.new
    @additional_locations = Location.additional_locations(current_person)
  end

  def build_location_and_interest
    begin
      location = Location.find_or_create_by(name: location_interest_params[:location_name])
      current_person.locations << location

      flash[:notice] = 'The location was created and added successfully to your profile.'
      redirect_to location_interests_path
    rescue ActiveRecord::RecordInvalid
      flash.now[:error] = 'There was a problem with your location.'
      render :new
    end
  end

  def create
    @location_interest = current_person.location_interests.create(location_id: location_interest_params[:location_id])

    if @location_interest.save
      flash[:notice] = 'The location interest was added successfully.'
      redirect_to location_interests_path
    else
      flash.now[:error] = 'The location interest could not be added.'
      render :new
    end
  end

  def destroy
    current_person.location_interests.destroy(params[:id])

    flash[:notice] = "The location interest was removed."
    redirect_to location_interests_path
  end

  private

  def location_interest_params
    params.require(:location_interest).permit(
      :location_name,
      :location_id
    )
  end
end
