class PostComment < ApplicationRecord
  belongs_to :post, class_name: "Post"
end
