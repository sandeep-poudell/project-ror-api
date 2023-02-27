class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: %i[show update destroy publish unpublish comment]
  require "date"
  def index
    @post = Post.where(author_id: @current_user.id)
  end

  def show; end

  def create
    form = PostCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @post = Post.new
    @post.author_id = @current_user.id
    @post.title = params[:title]
    @post.meta_title = params[:meta_title]
    @post.slug = params[:slug]
    @post.summary = params[:summary]
    @post.content = params[:content]
    return error_validation(@post.errors) if @post.invalid?

    @post.save!
  end

  def update
    form = PostUpdateForm.new(params)
    error_validation(form.errors) if form.invalid?

    @post.author_id = @current_user.id
    @post.title = form.title unless form.title.nil?
    @post.meta_title = form.meta_title unless form.meta_title.nil?
    @post.slug = form.slug unless form.slug.nil?
    @post.summary = form.summary unless form.summary.nil?
    @post.content = form.content unless form.content.nil?

    return error_validation(@post.errors) if @post.invalid?

    @post.save!
  end

  def publish
    @post.published = 1
    @post.published_date = DateTime.now
    @post.save!
    render_success(true)
  end

  def unpublish
    @post.published = 0
    @post.published_date = nil
    @post.save!
    render_success(true)
  end

  def destroy
    @post.destroy
  end

  def comment
    form = PostCommentCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @pc = PostComment.new
    @pc.post = @post
    @pc.title = form.title
    @pc.content = form.content

    return error_validation(@pc.errors) if @pc.invalid?

    @pc.save!

    render_success({ comment_created: true })
  end

  private

  def set_post
    @post = Post.find(params[:id])
    return error_unauthorized if @post.author_id != @current_user.id
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found!" }, status: 404
  end
end
