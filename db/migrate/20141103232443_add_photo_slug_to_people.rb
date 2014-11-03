class AddPhotoSlugToPeople < ActiveRecord::Migration
  def change
    add_column :people, :photo_slug, :string
  end
end
