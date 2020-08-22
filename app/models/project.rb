class Project < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :tasks
  validates :name, presence: true
end
