class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, :presence => true, :length => { :maximum => 1000, :minimum => 3 }
  validates :author, :presence =>true
  
end
