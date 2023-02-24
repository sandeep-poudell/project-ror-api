module Response
  extend ActiveSupport::Concern

  # For rendering success message
  def render_success(data)
    render json: {
      result: 'success',
      data: data
    }, status: :ok
  end

end