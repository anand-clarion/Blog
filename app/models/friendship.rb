class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
  validates :user_id, :uniqueness => {:scope => :friend_id}
end
