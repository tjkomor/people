class LocationInterest < ActiveRecord::Base
  belongs_to :person
  belongs_to :location

  attr_reader :location_name
end
