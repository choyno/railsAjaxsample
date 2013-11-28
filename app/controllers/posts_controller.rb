class PostsController < ApplicationController

  def index
    @posts = Post.where("delete_flag IS false")
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.js { render 'common' }
    end
  end

  def create

    @post = Post.new(post_params)

    if @post.save
      options 'create'
    end

    respond_to do |format|
      format.js { render 'common' }
    end

  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js { render 'common' }
    end
  end

  def update

    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      options 'update'
    end

    respond_to do |format|
      format.js { render 'common' }
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.update_attributes(:delete_flag => true)
    options 'destroy'
    respond_to do |format|
      format.js { render 'common' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def options(option)
    @con = {:option => option}
  end

end
