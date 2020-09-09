class Projects::Assign
  prepend SimpleCommand

  def initialize(project:, user:)
    @project = project
    @user = user
  end

  def call
    (activate_existing_assignment || create_assignment) && notify
  end

  private

  attr_accessor :project, :user

  def notify
    data = {
        routing_key: user,
        resource: 'project',
        action: 'assign',
        payload: project
    }
    Services::Notifier.new(data).call
  end

  def activate_existing_assignment
    assignment = ProjectAssignment.find_by(project_id: project.id, user: user)
    return nil if assignment.nil?

    errors.add_multiple_errors(assignment.errors.to_hash) unless assignment.activate
    assignment
  end

  def create_assignment
    assignment = ProjectAssignment.new(project_id: project.id, user: user)
    return assignment if assignment&.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end