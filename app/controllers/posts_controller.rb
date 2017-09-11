class PostsController < ApplicationController

before_action :set_post, only: [:show, :update, :edit, :destroy]
# before_action :set_user

  def index
    @posts = current_user.posts
  end

  def show
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render partial: "form"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render partial: "form"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end

    # def set_user
    #   @user = User.find(params[:id])
    # end
end
