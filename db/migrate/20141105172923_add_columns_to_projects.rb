class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_url, :string
    add_column :projects, :my_focus, :text
    add_column :projects, :code_climate_badge_url, :string
    add_column :projects, :travis_ci_badge_url, :string
    add_column :projects, :screenshot, :string
    add_column :projects, :production_url, :string

    remove_column :projects, :url
    remove_column :projects, :focused_on
  end
end
