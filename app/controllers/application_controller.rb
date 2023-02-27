# frozen_string_literal: true

class ApplicationController < ActionController::API
  # Must include all modules in concerns and helpers so that modules and methods in them can be used elsewhere. Here it is used in controllers and form and views
  include UserHelper
  include Response
  include ErrorResponse
  include Authentication
end
