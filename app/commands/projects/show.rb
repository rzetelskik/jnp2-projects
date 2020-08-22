class Projects::Show
  prepend SimpleCommand

  def initialize(project:)
    @project = project
  end

  def call
    project
  end

  private

  attr_accessor :project
end