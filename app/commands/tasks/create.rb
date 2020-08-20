class Tasks::Create
  prepend SimpleCommand

  def initialize(project_id:, name:, description:, created_by:)
    @project_id = project_id
    @name = name
    @description = description
    @created_by = created_by
  end

  def call
    create_task
  end

  private

  attr_accessor :project_id, :name, :description, :created_by

  def create_task
    puts(created_by)
    task = Task.new(project_id: project_id, name: name, description: description, created_by: created_by)
    return task if task.save

    errors.add_multiple_errors(task.errors.to_hash)
    nil
  end
end