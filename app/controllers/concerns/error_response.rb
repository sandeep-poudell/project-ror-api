# frozen_string_literal: true

module ErrorResponse
  extend ActiveSupport::Concern

  # For checking validation of objects. In this case this check validation of form object for create action used in users_controller
  def error_validation(causes = nil, message = nil, message_body = nil)
    @code = 400
    @url = request.url
    @message = "Validation Error."
    @message = message unless message.nil?
    @message_body = message_body unless message_body.nil?
    @cause = causes

    # renders view in views>response>error.json.jbuilder
    render template: "response/error", status: :bad_request
  end

  # For checking logged in user authorization before other actions expect create action used in users_controller
  def error_unauthorized(message = nil, message_body = nil)
    @code = 401
    @url = request.url
    @message = "Unauthorized."
    @message = message unless message.nil?
    @message_body = message_body unless message_body.nil?
    @cause = nil

    # renders view from views>response>error.json.jbuilder
    render template: "response/error", status: :unauthorized
  end
end
