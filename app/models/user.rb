class User < ActiveRecord::Base
  letsrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friendships
  has_many :friends
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  validates :name, presence: true
  validates :phone_no,  presence: true, length: { is: 10 , message: "must be 10 digit long" }, numericality: { only_integer: true }
  validates :city,  presence: true, length: { minimum: 5 }

  # This action search for matched data in table for user search 
  def self.search(search)
    if search
      where("name like ? OR city like ? ", "%#{search}%","%#{search}%")
    end
  end

  # This action prohibited dectivated user from login
  def active_for_authentication?
    super && self.is_active
  end

  # This action set a message for deactivated user.
  def inactive_message
    "Sorry, this account has been deactivated. Please contact to Admin"
  end
end
