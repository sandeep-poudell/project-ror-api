# json.extract! user, :first_name,
#               :last_name,
#               :first_name_kana,
#               :last_name_kana,
#               :gender,
#               :email,
#               :password,
#               :birth_date,
#               :height,
#               :weight

# Helpers are used for formatting some values. Here, various methods defined in UserHelper from user_helper.rb helper is used

json.id user.id
json.full_name user.first_name
json.first_name_kana user.first_name_kana
json.last_name_kana user.last_name_kana
json.age user.age
json.gender user.gender
json.email user.email
json.phone_number user.phone_number
json.birth_date user.birth_date
json.height user.height
json.weight user.weight