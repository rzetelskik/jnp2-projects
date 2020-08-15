class Index
  prepend SimpleCommand

  def call
    projects
  end

  private

  def projects
    Project.joins(:assignments).where(assignments: {user_id: @current_user, active: true})
  end
end