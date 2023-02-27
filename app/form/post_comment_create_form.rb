class PostCommentCreateForm
  include ActiveModel::Model

  attr_accessor :title,
                :content

  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..1000 }

  def initialize(params = {})
    @title = params[:title]
    @content = params[:content]
  end
end
