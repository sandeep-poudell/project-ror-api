json.result 'success'
json.updated true
json.data do
  json.partial! 'articles/article', article: @article
end