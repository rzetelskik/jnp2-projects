class Create
  prepend SimpleCommand

  def initialize(name, user_id)
    @name = name
    @user_id = user_id
  end

  def call
    create_project
  end

  private

  attr_accessor :user_id, :name

  def create_project
    project = Project.new(name: name)
    return project if project.save and assign(project)

    errors.add_multiple_errors(project.errors.to_hash)
    nil
  end

  def assign(project)
    assignment = ProjectAssignment.new(project_id: project.id, user_id: user_id, owner: true)
    return assignment if assignment.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end