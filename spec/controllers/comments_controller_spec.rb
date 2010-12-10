require 'spec_helper'

describe CommentsController do
  
  before(:all) do
    Post.delete_all
    @post = Post.new(:title => "title", :content => "content")
    @post.save!
    @comment = Comment.new (:author => "author", :content => "content")
    @comment.post = @post
    @comment.save
  end

  describe "POST 'create'" do
    it "should create a new comment with valid info" do
      post_count = @post.comments.size
      hash={:author => "author", :content => "content"}
      post 'create', {:post_id => @post.id, :comment => hash} 
      response.should redirect_to(post_path(@post))
      @post.comments.size == post_count + 1
    end
    
    it "shouldn't create a new comment with invalid info" do
      post_count = @post.comments.size
      hash={:author => "author", :content => "c"}
      post 'create', {:post_id => @post.id, :comment => hash}
      response.should render_template("posts/show")
      @post.comments.size == post_count
    end
  end

  describe "DELETE 'destroy'" do
    
    it "should delete a comment" do
      comment_count = Comment.count
      delete "destroy", {:post_id => @post.id,:id => @comment.id}
      response.should redirect_to(post_path(@post))
      Comment.count.should == comment_count - 1
    end
  
  end

end
