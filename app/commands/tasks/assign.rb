class Tasks::Assign
  prepend SimpleCommand

  def initialize(task_id:, user_id:)
    @task_id = task_id
    @user_id = user_id
  end

  def call
    assign
  end

  private

  attr_accessor :task_id, :user_id

  def assign
    assignment = TaskAssignment.new(task_id: task_id, user_id: user_id)
    return assignment if assignment&.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end