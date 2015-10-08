class Location < ActiveRecord::Base
  has_many :location_interests
  has_many :people, through: :location_interests

  validates_uniqueness_of :name
  validates_presence_of :name

  def self.names
    order(:name).pluck(:name)
  end

  def self.active
    order("split_part(name, ', ', 2)").where('locations.location_interests_count > 0')
  end

  def self.visible
    active.select{|location| location.people.detect{|p| !p.hidden}}
  end

  def self.order_by_state_and_city
    order("split_part(name, ', ', 2), split_part(name, ', ', 1)")
  end

  def self.additional_locations(person)
    order_by_state_and_city - person.locations
  end
end
