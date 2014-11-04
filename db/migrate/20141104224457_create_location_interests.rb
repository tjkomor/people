class CreateLocationInterests < ActiveRecord::Migration
  def change
    create_table :location_interests do |t|
      t.integer :location_id
      t.integer :person_id

      t.timestamps
    end
  end
end
