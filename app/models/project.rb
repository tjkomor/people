class Project < ActiveRecord::Base
  belongs_to :person
  mount_uploader :screenshot, ScreenshotUploader
end
