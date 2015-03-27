class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "POST SUCCESSFULLY SAVED!!!"
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post])
      flash[:notice] = "POST SUCCESSFULLY UPDATED!!!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "POST DELETED!!!"
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
