require 'spec_helper'

describe Comment do
  
  before(:all) do
    @post = Post.new(:title => "holaaaaaaa", :content => "connnnnnnnntentttt")
    @post.save
  end
  before(:each) do
    @comment = Comment.new
    
  end  
  
  it "should have a associated @comment" do
    @comment.author = "me"; @comment.content = "my comment"
    @comment.should_not be_valid
    
  end
  
  it "should not create a new @comment without author" do
    @comment.author = nil
    @comment.content = "my comment"
    @comment.post = @post
    @comment.should_not be_valid
  end
    
  
  it "should not create a new @comment without content" do
    @comment.author = "author"
    @comment.content = nil
    @comment.post = @post
    @comment.should_not be_valid
  end
  
  it "should not create a comment with less than 3 chars in content" do
    @comment.author = "a1111111111"
    @comment.content = "a"
    @comment.post = @post    
  end
  
  it "should not create a comment with more than 1000 chars in author" do
    @comment.author = "aaaaaaaaaaaaaaaa"
    @comment.content = "a"*1001
    @comment.post = @post
    @comment.should_not be_valid   
  end
  
end