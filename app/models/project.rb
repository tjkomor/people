class Project < ActiveRecord::Base
  belongs_to :person
  mount_uploader :screenshot, ScreenshotUploader

  def self.editable_attributes
    %w(title description my_focus github_url production_url
       travis_ci_badge_url code_climate_badge_url screenshot)
  end
end
