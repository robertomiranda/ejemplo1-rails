require 'spec_helper'

describe Post do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @post = Post.new
  end
  
  it "should create a new post with title" do
    @post.title = "title 2"
    @post.content = "content"
    @post.should be_valid    
  end
  
  it "should create a new post with minimum 3 characters for the title" do
    post = Post.new(:title => "t",:content => "content")
    post.save.should be_false
  end
  
  it "should create a new post with maximum 3 characters for the title" do
    s = "t"*101
    post = Post.new(:title => s,:content => "content")
    post.save.should be_false
  end
  
  it "should create a new post with unique title" do
    post1 = Post.new(:title => "title",:content => "content")
    post1.save 
    post2 = Post.new(:title => "title",:content => "content")
    post2.save.should be_false
  end
  
  it "should create a new post with content" do
     post1 = Post.new(:title => "title",:content => "content")
     post1.content.should_not be_nil    
  end  
  
  
end