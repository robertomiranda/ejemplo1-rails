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
  end

  def edit
  end

  def update
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