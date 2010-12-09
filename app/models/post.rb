class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy, :order => "id"
  #has_one :comment
  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 100, :minimum => 3 }
  validates :content, :presence =>true
  
  def to_csv
    return title.to_s + "," + content.to_s  
  end
end
