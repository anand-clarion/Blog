class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  letsrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments

  def self.search(search)
    if search
      where("name like ? OR city like ? ", "%#{search}%","%#{search}%")
    end
  end

  def active_for_authentication?
    super && self.is_active # i.e. super && self.is_active
  end

  def inactive_message
    "Sorry, this account has been deactivated. Please contact to Admin"
  end
end
