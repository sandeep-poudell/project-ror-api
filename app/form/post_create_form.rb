class PostCreateForm
  include ActiveModel::Model

  # slug validation format
  SLUG_VALIDATION_FORMAT = /\A[a-zA-Z0-9_-]+\z/

  attr_accessor :title,
                :meta_title,
                :slug,
                :summary,
                :content

  validates :title, presence: true, length: { in: 1..255 }
  validates :meta_title, presence: true, length: { in: 1..50 }
  validates :slug, presence: true, length: { in: 5..50 }, format: {
    with: SLUG_VALIDATION_FORMAT,
    message: "Slug must only contain alphanumeric characters with symbols [_] & [-]."
  }
  validates :summary, presence: true, length: { in: 1..250 }
  validates :content, presence: true, length: { in: 1..1000 }

  def initialize(params = {})
    @title = params[:title]
    @meta_title = params[:meta_title]
    @slug = params[:slug]
    @summary = params[:summary]
    @content = params[:content]
  end
end
