class PostsController < ApplicationController

  def index

    list_all

    respond_to do |format|
      format.html
      format.js
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      respond_to do |format|
        format.js
      end
    end
  end



  def show
    @post = Post.find(params[:id])
    list_all
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.update_attributes(:delete_flag => true)
    list_all
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def list_all
    @posts = Post.where("delete_flag IS false")
  end
end
