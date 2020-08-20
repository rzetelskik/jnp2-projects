class Project < ApplicationRecord
  has_many :project_assignments
  validates :name, presence: true
end
