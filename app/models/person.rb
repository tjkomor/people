class Person < ActiveRecord::Base
  validates_uniqueness_of :slug

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
    self.slug = I18n.transliterate(full_name).downcase.gsub(" ", "_")
  end

  def to_param
    slug
  end

  def self.editable_attributes
    [
      :first_name,
      :last_name,
      :email_address,
      :github_url,
      :looking_for,
      :best_at,
      :cohort_id,
      :photo_slug,
      :hidden,
      :introduction,
      :hired,
      :hired_by
    ]
  end

  def image_url
    if photo_slug
      "students/#{photo_slug}"
    else
      "students/no_photo.jpg"
    end
  end

  def status
    if hired
      'hired'
    else
      'available'
    end
  end
end
