# frozen_string_literal: true

class UserCreateForm
  # This module provides a simple way to create form-like objects that do not inherit from ActiveRecord.
  # By including this module we can add a number of common features to your Ruby classes, such as attribute accessors, mass-assignment, validations, and more.
  include ActiveModel::Model

  # attr_accessor is a Ruby method that is used to define an attribute for a Ruby class. It creates a getter and setter method for the specified attribute that can be used to read or write its value.
  attr_accessor :first_name,
                :last_name,
                :first_name_kana,
                :last_name_kana,
                :gender,
                :email,
                :password,
                :birth_date,
                :height,
                :weight

  # Defining validations to form values
  # Constants are defined in file config/initializers/constant.rb eg. KANA_VALIDATION_FORMAT

  validates :first_name, presence: true, length: { in: 1..25 }
  validates :last_name, presence: true, length: { in: 1..25 }
  validates :first_name_kana, presence: true, length: { in: 1..25 }, format: {
    with: KANA_VALIDATION_FORMAT,
    message: "Field must be in Katakana format.",
    allow_blank: true
  }

  validates :last_name_kana, presence: true, length: { in: 1..25 }, format: {
    with: KANA_VALIDATION_FORMAT,
    message: "Field must be in Katakana format.",
    allow_blank: true
  }

  validates :gender, presence: true, inclusion: { in: GENDER_OPTIONS }
  validates :email, presence: true, length: { in: 5..255 }, format: {
    with: EMAIL_VALIDATION_FORMAT,
    message: "Email format incorrect."
  }
  validates :password, presence: true, length: { in: 8..50 }, format: {
    with: PASSWORD_CONTAINS_FORMAT,
    message: "Password must have only have half width alphanumeric characters and must include: 1 uppercase, 1 lowercase, and 1 digit"
  }
  validates :birth_date, presence: true
  validates :height, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 500 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }

  # Initialization of form values. params are passed from users_controller
  def initialize(params = {})
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @first_name_kana = params[:first_name_kana]
    @last_name_kana = params[:last_name_kana]
    @gender = params[:gender]
    @email = params[:email]
    @password = params[:password]
    @birth_date = params[:birth_date]
    @height = params[:height]
    @weight = params[:weight]
  end
end
