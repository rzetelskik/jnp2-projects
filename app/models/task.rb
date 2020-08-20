class Task < ApplicationRecord
  has_many :task_assignments
  validates :project_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :created_by, presence: true
end
