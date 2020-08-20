class TasksController < ApplicationController
  before_action :set_project_id, except: [:assign, :unassign]
  before_action :set_task_id, only: [:assign, :unassign]

  def create
    data = {
        project_id: project_id,
        name: params.require(:name),
        description: params.require(:description),
        created_by: current_user
    }
    command = Tasks::Create.call(data)
    if command.success?
      render_success(command.result.slice(:id), :created)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def index
    data = {
        project_id: project_id
    }
    command = Tasks::Index.call(data)
    if command.success?
      render_success(command.result)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def assigned
    data = {
        project_id: project_id,
        user_id: current_user
    }
    command = Tasks::Assigned.call(data)
    if command.success?
      render_success(command.result)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def assign
    data = {
        task_id: task_id,
        user_id: params.require(:user_id)
    }
    command = Tasks::Assign.call(data)
    if command.success?
      render_success(command.result, :no_content)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def unassign
    data = {
        task_id: task_id,
        user_id: params.require(:user_id)
    }
    command = Tasks::Unassign.call(data)
    if command.success?
      render_success(command.result, :no_content)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  private

  attr_accessor :project_id, :task_id

  def set_project_id
    @project_id = params.require(:project_id)
  end

  def set_task_id
    @task_id = params.require(:id)
  end
end