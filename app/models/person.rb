class Person < ActiveRecord::Base
  has_many :projects
  belongs_to :cohort

  def full_name
    [first_name, last_name].join(" ")
  end
end
