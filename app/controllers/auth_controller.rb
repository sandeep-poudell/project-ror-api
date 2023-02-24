class AuthController < ApplicationController
  def login
    # Creates form object using AuthLoginForm class defined in auth_login_form.rb in app>form directory
    form = AuthLoginForm.new(params)

    # Checks for error_validation defined in error_response.rb concern file
    return error_validation(form.errors) if form.invalid?
    @user = User.where(email: form.email).first

    # Checks for error_unauthorized defined in error_response.rb concern file
    return error_unauthorized("Access Denied!") if @user.nil? || BCrypt::Password.new(@user.password) != form.password

    # Calls module from concern file response.rb
    render_success({ token: @user.token })

  # Exception handling when user record is not found
  rescue ActiveRecord::RecordNotFound
    return error_unauthorized("Access Denied!")
  end
end
