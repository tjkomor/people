class AddGithubUrlToPerson < ActiveRecord::Migration
  def change
    add_column :people, :github_url, :person
  end
end
