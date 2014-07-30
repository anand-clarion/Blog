class Comment < ActiveRecord::Base
  def self.search(search)
    if search
      where("content like ?", "%#{search}%") 
    end
  end
end
