class Create
  prepend SimpleCommand

  def initialize(name)
    @name = name
  end

  def call
    create_project
  end

  private

  attr_accessor :name

  def create_project
    project = Project.new(name: name)
    return project if project.save and assign(project)

    errors.add_multiple_errors(project.errors.to_hash)
    nil
  end

  def assign(project)
    assignment = Assignment.new(project_id: project.id, user_id: @current_user, owner: true)
    return assignment if assignment.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end