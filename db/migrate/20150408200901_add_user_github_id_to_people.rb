class AddUserGithubIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :github_id, :integer
  end
end
