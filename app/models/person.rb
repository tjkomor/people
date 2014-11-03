class Person < ActiveRecord::Base
  has_many :projects
  belongs_to :cohort
  validates_uniqueness_of :slug

  before_save :generate_slug

  def full_name
    [first_name, last_name].join(" ")
  end

  def generate_slug
    self.slug = full_name.downcase.gsub(" ", "_")
  end

  def to_param
    slug
  end
end
