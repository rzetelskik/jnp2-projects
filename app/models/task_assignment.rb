class TaskAssignment < ApplicationRecord
  belongs_to :task
  validates :user_id, presence: true, uniqueness: { scope: :task_id }
  validates :task_id, presence: true
end
