# frozen_string_literal: true

json.result "success"
json.updated true
json.data do
  json.partial! "users/user", user: @user
end
