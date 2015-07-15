class Person < ActiveRecord::Base
  validates :slug,       uniqueness: true
  validates :cohort_id,  presence: true

  validate :check_portfolio_completion

  has_many :projects
  has_many :location_interests
  has_many :locations, through: :location_interests
  belongs_to :cohort

  mount_uploader :resume, ResumeUploader

  before_validation :generate_slug

  scope :active, -> { where(hidden: false).where(hired: false) }

  def check_portfolio_completion
    if not_complete?
      errors.add(:hidden, 'You need to complete your portfolio before unhidding it. Have you completed all the (*) required fields?')
    end
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

  def csv_attributes
    csv_attributes = attributes
    csv_attributes[:cohort_name]    = cohort_name
    csv_attributes[:location_names] = location_names
    csv_attributes
  end

  private

  def cohort_name
    return cohort.name if cohort
  end

  def location_names
    return locations.pluck(:name).join(', ') unless locations.empty?
  end

  def no_photo?
    photo_slug.nil? || photo_slug.empty?
  end

  def not_complete?
    hidden == false && pending_attributes?
  end

  def pending_attributes?
    attributes.any? { |attribute, value| empty_value?(value) && required_attributes.include?(attribute) }
  end

  def empty_value?(value)
    return true if value.nil?
    return true if value.class == String && value.empty?
  end

  def required_attributes
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
      :introduction
    ]
  end
end
