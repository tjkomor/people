class Person < ActiveRecord::Base
  has_many :projects
  belongs_to :cohort
end
