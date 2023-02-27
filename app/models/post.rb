class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy, class_name: "PostComment"

  validates :slug, uniqueness: { case_sensitive: false }
end
