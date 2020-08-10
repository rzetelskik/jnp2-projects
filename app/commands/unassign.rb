class Unassign
  prepend SimpleCommand

  def initialize(project_id, user_id)
    @project_id = project_id
    @user_id = user_id
  end

  def call
    activate_existing_assignment || create_assignment
  end

  private

  attr_accessor :project_id, :user_id

  def activate_existing_assignment
    assignment = Assignment.find_by(project_id: project_id, user_id: user_id)
    return nil if assignment.nil?

    errors.add_multiple_errors(assignment.errors.to_hash) unless assignment.activate
    assignment
  end

  def create_assignment
    assignment = Assignment.new(project_id: project_id, user_id: user_id)
    return assignment if assignment&.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end