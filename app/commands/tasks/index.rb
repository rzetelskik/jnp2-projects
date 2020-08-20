class Tasks::Index
  prepend SimpleCommand

  def initialize(project_id:)
    @project_id = project_id
  end

  def call
    tasks
  end

  private

  attr_accessor :project_id

  def tasks
    Task.where(project_id: project_id)
  end
end