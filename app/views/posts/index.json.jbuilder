json.result "success"
json.data do
  json.array! @post.each do |post|
    json.partial! "posts/post", post:
  end
end
