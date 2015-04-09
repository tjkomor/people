class SwapGithubIdForUserGithubId < ActiveRecord::Migration
  def change
    remove_column :people, :github_id, :integer
    add_column :people, :user_github_id, :integer
  end
end
