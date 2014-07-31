class Post < ActiveRecord::Base
  letsrate_rateable :title
  belongs_to :user
  has_many :comments
  def self.search(search)
    if search
       where("title like ? OR content like ?", "%#{search}%","%#{search}%") 
    end
  end
end
