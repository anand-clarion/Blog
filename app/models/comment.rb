class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  def self.search(search)
    if search
      where("content like ?", "%#{search}%") 
    end
  end
end
