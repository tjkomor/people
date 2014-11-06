class LocationInterest < ActiveRecord::Base
  belongs_to :person
  belongs_to :location, counter_cache: true

  attr_reader :location_name
end
