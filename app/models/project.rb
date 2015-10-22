class Project < ActiveRecord::Base
  belongs_to :person
  mount_uploader :screenshot, ScreenshotUploader

  validates_format_of :github_url,              with: URI.regexp, if: Proc.new { |p| p.github_url.present? }
  validates_format_of :code_climate_badge_url,  with: URI.regexp, if: Proc.new { |p| p.code_climate_badge_url.present? }
  validates_format_of :travis_ci_badge_url,     with: URI.regexp, if: Proc.new { |p| p.travis_ci_badge_url.present? }
  validates_format_of :production_url,          with: URI.regexp, if: Proc.new { |p| p.production_url.present? }
end
