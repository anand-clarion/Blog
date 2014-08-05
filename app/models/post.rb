class Post < ActiveRecord::Base
  letsrate_rateable :title
  belongs_to :user
  belongs_to :category
  has_many :comments,     dependent:  :destroy
  validates :title, length: { minimum: 5 }
  validates :content, length: { minimum: 10 }
  
  # This action search for matched data in table for user search 
  def self.search(search)
    if search
       where("title like ? OR content like ?", "%#{search}%","%#{search}%") 
    end
  end
  
end
