class Tasks::Assign
  prepend SimpleCommand

  def initialize(task:, user:)
    @task = task
    @user = user
  end

  def call
    assign
  end

  private

  attr_accessor :task, :user

  def assign
    assignment = TaskAssignment.new(task_id: task.id, user: user)
    return assignment if assignment&.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end