class ProjectsController < ApplicationController
  def create
    command = Projects::Create.call(params.require(:name), current_user)
    if command.success?
      render_success(command.result.slice(:id))
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def assign
    command = Projects::Assign.call(params.require(:id), params.require(:user_id))
    if command.success?
      render_success(nil, :no_content)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def unassign
    command = Projects::Unassign.call(params.require(:id), params.require(:user_id))
    if command.success?
      render_success(nil, :no_content)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def index
    command = Projects::Index.call(current_user)
    if command.success?
      render_success(command.result.select(:id, :name))
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def show
    command = Projects::Show.call(params.require(:id))
    if command.success?
      render_success(command.result)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end
end
