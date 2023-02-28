# frozen_string_literal: true

class ApplicationController < ActionController::API
  # Must include all modules in concerns and helpers so that modules and methods in them can be used elsewhere. Here it is used in controllers and form and views

  # For helper module user helper keyword instead of include. It was causing to not finding helper module while using include.

  helper UserHelper
  include Response
  include ErrorResponse
  include Authentication
end
