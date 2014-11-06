class AddInterestCountToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :location_interests_count, :integer, default: 0, null: false

    Location.all.pluck(:id).each do |id|
      Location.reset_counters(id, :location_interests)
    end
  end
end
