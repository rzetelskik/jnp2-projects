class Tasks::Show
  prepend SimpleCommand

  def initialize(task:)
    @task = task
  end

  def call
    task
  end

  private

  attr_accessor :task
end