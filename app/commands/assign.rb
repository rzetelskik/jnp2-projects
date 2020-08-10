class Assign
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
    puts("existing 1")
    assignment = Assignment.find_by(project_id: project_id, user_id: user_id)
    puts(assignment.inspect)
    return nil if assignment.nil?
    puts("existing 2")

    errors.add_multiple_errors(assignment.errors.to_hash) unless assignment.activate
    puts(errors.inspect)
    puts("existing 3")
    assignment
  end

  def create_assignment
    puts("create 1")
    assignment = Assignment.new(project_id: project_id, user_id: user_id)
    puts(assignment.inspect)
    return assignment if assignment&.save

    errors.add_multiple_errors(assignment.errors.to_hash)
    nil
  end
end