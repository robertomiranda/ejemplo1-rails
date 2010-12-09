class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    respond_to do |format|
      format.html { render :index }
      format.xml { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render :action => :edit
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to :action => :index 
    else
      render :action => :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :action => :index
  end

end
