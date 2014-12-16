class SupportGettingHired < ActiveRecord::Migration
  def change
    add_column :people, :hired, :boolean, :default => false
    add_column :people, :hired_by, :text
  end
end
