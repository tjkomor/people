class Person < ActiveRecord::Base
  validates :slug,      uniqueness: true
  validates :cohort_id, presence: true

  has_many :projects
  has_many :location_interests
  has_many :locations, through: :location_interests
  belongs_to :cohort

  mount_uploader :resume, ResumeUploader

  before_save :generate_slug

  def self.active
    where(hidden: false).where(hired: false)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_slug
    self.slug = full_name.parameterize.gsub('-', '_')
  end

  def to_param
    slug
  end

  def image_url
    if no_photo?
      "students/no_photo.jpg"
    else
      "students/#{photo_slug}"
    end
  end

  def status
    hired ? 'hired' : 'available'
  end

  private

  def no_photo?
    photo_slug.nil? || photo_slug.empty?
  end
end
