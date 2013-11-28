class PostsController < ApplicationController

  respond_to :js, :html

  def index
    list_all
    respond_with
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'create'
      redirect_to post_path(@post)
    else
      respond_with
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = 'update'
      redirect_to post_path(@post)
    else
      respond_with
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_with
  end

  def destroy
    @post = Post.find(params[:id])
    @post.update_attributes(:delete_flag => true)
    respond_with
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def list_all
    @posts = Post.where("delete_flag IS false")
  end
end
