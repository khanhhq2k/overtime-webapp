class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = if ADMIN_USER_TYPES.include?(current_user.type)
      Post.all
    else
      Post.user_posts(current_user)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "Successfully created post!"
    else
      render :new
    end
  end

  def show

  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Successfully updated post!"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: "Successfully deleted post!"
  end

  private
  def post_params
    params.require(:post).permit([:date, :rationale, :status, :overtime_request])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
