class PostUpdateForm
  include ActiveModel::Model

  # slug validation format
  SLUG_VALIDATION_FORMAT = /\A[a-zA-Z0-9_-]+\z/

  attr_accessor :title,
                :meta_title,
                :slug,
                :summary,
                :content

  validates :title, length: { in: 1..255, allow_blank: true }
  validates :meta_title, length: { in: 1..50, allow_blank: true }
  validates :slug, length: { in: 5..50, allow_blank: true }, format: {
    with: SLUG_VALIDATION_FORMAT,
    message: "Slug must only contain alphanumeric characters with symbols [_] & [-].",
    allow_blank: true
  }
  validates :summary, length: { in: 1..250, allow_blank: true }
  validates :content, length: { in: 1..1000, allow_blank: true }

  def initialize(params = {})
    @title = params[:title]
    @meta_title = params[:meta_title]
    @slug = params[:slug]
    @summary = params[:summary]
    @content = params[:content]
  end
end
