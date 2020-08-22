class Projects::Unassign
  prepend SimpleCommand

  def initialize(project:, user:)
    @project = project
    @user = user
  end

  def call
    deactivate(assignment)
  end

  private

  attr_accessor :project, :user

  def assignment
    assignment = ProjectAssignment.find_by(project_id: project.id, user: user)
    errors.add(:base, "User has not been assigned yet") if assignment.nil?

    assignment
  end

  def deactivate(assignment)
    errors.add_multiple_errors(assignment.errors.to_hash) unless assignment&.deactivate
  end
end