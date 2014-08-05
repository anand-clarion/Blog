class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => true
  validates :content, presence: true

  # This action search for matched data in table for user search.
  def self.search(search)
    if search
      where("content like ?", "%#{search}%") 
    end
  end
end
