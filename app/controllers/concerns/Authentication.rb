module Authentication
  # Concern is essentially a module that contains a set of related methods. It is implementation of DRY(Don't Repeat Yourself)
  # This lets us to use this module in any number of classes and methods defined in the module will be available to those classes.
  extend ActiveSupport::Concern

  def authenticate_user
    # error_unauthorized method is defined in another concern file error_response.rb. Return if token is not present.
    return error_unauthorized if request.headers['token'].nil?

    # Finding use with the token provided
    user = User.where(token: request.headers['token']).first

    # again calls error_unauthorized method if user is not found
    return error_unauthorized if user.nil?

    # sets current user to the user
    @current_user = user

  end
end