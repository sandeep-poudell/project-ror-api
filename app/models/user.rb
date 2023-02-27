# frozen_string_literal: true

class User < ApplicationRecord
  # self.table_name = 'user' is used if we want to associate model with table name of `user` otherwise assumed generally as users(plural) if not specified
  # self.table_name = 'user'

  validates :email, uniqueness: { case_sensitive: false }

  # Defining method to calculate age of the user
  def calculate_age(dob)
    now = Time.now.utc.to_date
    self.age = now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end
end
