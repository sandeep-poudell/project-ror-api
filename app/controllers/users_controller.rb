# frozen_string_literal: true

class UsersController < ApplicationController
  # authenticate_user is a method in authentication.rb(module) which is a concern file. For checking if user is logged in*
  before_action :authenticate_user, except: %i[create]

  # this is required for saving user password in create action
  require "bcrypt"

  def index
    # Initializing User instance as @users
    @users = User.all
  end

  def show
    # Initializing User instance as @user same as @current_user
    @user = @current_user
  end

  def create
    # UserCreateForm is class in app>form user_create_form.rb file. Here, form is a object initialized with that class which handles the validation of the form.
    form = UserCreateForm.new(params)

    # error_validation is a method defined in error_response.rb(module) which is a concern file. For checking and rendering errors in form
    return error_validation(form.errors) if form.invalid?

    # Printing only for viewing purpose in output*
    puts form.first_name

    # Assigning form value inputted to @user instance
    @user = User.new
    @user.first_name = form.first_name
    @user.last_name = form.last_name
    @user.first_name_kana = form.first_name_kana
    @user.last_name_kana = form.last_name_kana
    @user.gender = form.gender
    @user.email = form.email
    @user.password = BCrypt::Password.create(form.password)
    @user.birth_date = form.birth_date
    @user.height = form.height
    @user.weight = form.weight
    @user.set_age(@user.birth_date)
    @user.token = Digest::UUID.uuid_v4

    # Checking validation after assigning value as same as checking validation for form above
    return error_validation(@user.errors) if @user.invalid?

    # bang ! is just a naming convention that Ruby programmers use to denote that a method can be “dangerous”
    @user.save!
  end

  def update
    # UserCreateForm is class in app>form user_create_form.rb file. Here, form is a object initialized with that class
    form = UserCreateForm.new(params)

    # error_validation is a method defined in error_response.rb(module) which is a concern file. For checking and rendering errors in form
    # error_validation(form.errors) if form.invalid?

    @user = @current_user

    # Assigning form value inputted to @user instance. unless is just opposite of if
    @user.first_name = form.first_name unless form.first_name.nil?
    @user.last_name = form.last_name unless form.last_name.nil?
    @user.first_name_kana = form.first_name_kana unless form.first_name_kana.nil?
    @user.last_name_kana = form.last_name_kana unless form.last_name_kana.nil?
    @user.gender = form.gender unless form.gender.nil?
    @user.email = form.email unless form.email.nil?
    @user.password = BCrypt::Password.create(form.password) unless form.password.nil?
    @user.birth_date = form.birth_date unless form.birth_date.nil?
    @user.height = form.height unless form.height.nil?
    @user.weight = form.weight unless form.weight.nil?
    @user.set_age(@user.birth_date)

    # Checking validation after assigning value as same as checking validation for form above
    return error_validation(@user.errors) if @user.invalid?

    # bang ! is just a naming convention that Ruby programmers use to denote that a method can be “dangerous”
    @user.save
  end

  def destroy
    # Sets @user to @current user so that only current logged in user can be deleted
    @user = @current_user
    @user.destroy
  end
end
