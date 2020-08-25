class Tasks::Show
  prepend SimpleCommand

  def initialize(task:)
    @task = task
  end

  def call
    task.as_json.merge({ assignees: task.task_assignments.to_json })
  end

  private

  attr_accessor :task
end