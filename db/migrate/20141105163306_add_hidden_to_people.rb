class AddHiddenToPeople < ActiveRecord::Migration
  def change
    add_column :people, :hidden, :boolean, :default => false
  end
end
