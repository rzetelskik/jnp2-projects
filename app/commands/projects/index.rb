class Projects::Index
  prepend SimpleCommand

  def initialize(user_id)
    @user_id = user_id
  end

  def call
    projects
  end

  private

  attr_accessor :user_id

  def projects
    Project.joins(:project_assignments).where(project_assignments: {user_id: user_id, active: true})
  end
end