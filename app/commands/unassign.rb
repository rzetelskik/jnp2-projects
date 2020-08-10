class Unassign
  prepend SimpleCommand

  def initialize(project_id, user_id)
    @project_id = project_id
    @user_id = user_id
  end

  def call
    deactivate(assignment)
  end

  private

  attr_accessor :project_id, :user_id

  def assignment
    assignment = Assignment.find_by(project_id: project_id, user_id: user_id)
    errors.add(:base, "User has not been assigned yet") if assignment.nil?

    assignment
  end

  def deactivate(assignment)
    errors.add_multiple_errors(assignment.errors.to_hash) unless assignment&.deactivate
  end
end