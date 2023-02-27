json.id post.id
json.title post.title
json.meta_title post.meta_title
json.slug post.slug
json.summary post.summary
json.content post.content
json.author_name_katakana "#{post.author.first_name_kana} #{post.author.last_name_kana}"
json.published post.published == 1
json.published_date post.published_date
json.comments post.comments
