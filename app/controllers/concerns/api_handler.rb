module ApiHandler
  def render_error(message, status)
    render json: { error: message }, status: status
  end

  def render_success(data = {}, status = :ok)
    render json: data, status: status
  end
end