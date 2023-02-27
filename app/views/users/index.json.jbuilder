# frozen_string_literal: true

json.result "success"
json.data do
  json.array! @users.each do |user|
    json.partial! "users/user", user:
  end
end
