class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.text :focused_on
      t.integer :person_id

      t.timestamps
    end
  end
end
