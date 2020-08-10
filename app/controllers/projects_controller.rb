class ProjectsController < ApplicationController
  def create
    command = Create.call(params.require(:user_id), params.require(:name))
    if command.success?
      render_success(command.result.slice(:id))
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def assign
    command = Assign.call(params.require(:id), params.require(:user_id))
    if command.success?
      render_success(nil, :no_content)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def unassign
    command = Unassign.call(params.require(:id), params.require(:user_id))
    if command.success?
      render_success(nil, :no_content)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def index
    command = Index.call(params.require(:user_id))
    if command.success?
      render_success(command.result.select(:id, :name))
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def show
    command = Show.call(params.require(:id))
    if command.success?
      render_success(command.result)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end
end
