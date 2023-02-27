json.result "success"
json.updated true
json.data do
  json.partial! "posts/post", post: @post
end
