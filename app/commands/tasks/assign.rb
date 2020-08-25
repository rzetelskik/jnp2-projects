class Tasks::Assign
  prepend SimpleCommand

  def initialize(task:, users:)
    @task = task
    @users = users || []
  end

  def call
    assign
  end

  private

  attr_accessor :task, :users

  def assigned
    @assigned ||= task.task_assignments.pluck(:user)
  end

  def assign
    TaskAssignment.where(user: (assigned - users)).destroy_all

    (users - assigned)&.try(:each) do |user|
      assignment = TaskAssignment.new(task: task, user: user)

      errors.add_multiple_errors(assignment.errors.to_hash) unless assignment&.save
    end
  end
end