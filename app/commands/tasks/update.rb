class Tasks::Update
  prepend SimpleCommand

  def initialize(task:, name:, description:)
    @task = task
    @name = name
    @description = description
  end

  def call
    update_task
  end

  private

  attr_accessor :task, :name, :description

  def update_task
    return if task.update(name: name, description: description)

    errors.add_multiple_errors(task.errors.to_hash)
    nil
  end
end