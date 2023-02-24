json.result 'success'
json.data do
  json.partial! 'users/user', user: @user
end

