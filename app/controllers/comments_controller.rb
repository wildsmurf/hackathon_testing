class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.new
    render partial: "form"
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@path)
    else
      render partial: "form"
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
