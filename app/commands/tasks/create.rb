class Tasks::Create
  prepend SimpleCommand

  def initialize(project:, name:, description:, created_by:)
    @project = project
    @name = name
    @description = description
    @created_by = created_by
  end

  def call
    create_task
  end

  private

  attr_accessor :project, :name, :description, :created_by

  def create_task
    task = Task.new(project_id: project.id, name: name, description: description, created_by: created_by)
    return task if task.save

    errors.add_multiple_errors(task.errors.to_hash)
    nil
  end
end