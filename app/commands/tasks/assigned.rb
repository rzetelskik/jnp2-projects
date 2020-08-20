class Tasks::Assigned
  prepend SimpleCommand

  def initialize(project_id:, user_id:)
    @project_id = project_id
    @user_id = user_id
  end

  def call
    assigned
  end

  private

  attr_accessor :project_id, :user_id

  def assigned
    Task.joins(:task_assignments).where(project_id: project_id, task_assignments: { user_id: user_id })
  end
end