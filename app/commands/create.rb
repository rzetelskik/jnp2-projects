class Create
  prepend SimpleCommand

  def initialize(user_id, name)
    @user_id = user_id
    @name = name
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
    assignment = Assignment.new(project_id: project.id, user_id: user_id, owner: true)
    return assignment if assignment.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end