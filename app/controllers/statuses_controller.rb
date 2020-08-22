class StatusesController < ApplicationController
  before_action :set_project
  before_action :set_status, only: [:update, :destroy]

  def create
    data = {
        project: project,
        name: params.require(:name)
    }
    command = Statuses::Create.call(data)
    if command.success?
      render_success(command.result.slice(:id), :created)
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def index
    data = {
        project: project
    }
    command = Statuses::Index.call(data)
    if command.success?
      render_success(command.result.select(:id, :name))
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def update
    data = {
        status: status,
        name: params.require(:name)
    }
    command = Statuses::Update.call(data)
    if command.success?
      render_no_content
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  def destroy
    data = {
        status: status
    }
    command = Statuses::Destroy.call(data)
    if command.success?
      render_no_content
    else
      render_error(command.errors.full_messages.first, :bad_request)
    end
  end

  private

  attr_accessor :project, :status

  def set_project
    @project = Project.find(params.require(:project_id))
  end

  def set_status
    @status = Status.find(params.require(:id))
  end
end