json.result "success"
json.created true
json.data do
  json.partial! "posts/post", post: @post
end
