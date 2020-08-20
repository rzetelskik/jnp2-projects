class Tasks::Unassign
  prepend SimpleCommand

  def initialize(task_id:, user_id:)
    @task_id = task_id
    @user_id = user_id
  end

  def call
    unassign
  end

  private

  attr_accessor :task_id, :user_id

  def unassign
    assignment = TaskAssignment.find_by(task_id: task_id, user_id: user_id)
    return if assignment&.destroy

    errors.add(:base, 'User is not assigned to this task')
    nil
  end
end