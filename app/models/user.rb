class User < ActiveRecord::Base
  letsrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, length: { minimum: 5 }
  validates :phone_no, length: { is: 10 , message: "Please Enter a valid 10 digit phone_no" }
  validates :city, length: { minimum: 5 }

  def self.search(search)
    if search
      where("name like ? OR city like ? ", "%#{search}%","%#{search}%")
    end
  end

  def active_for_authentication?
    super && self.is_active
  end

  def inactive_message
    "Sorry, this account has been deactivated. Please contact to Admin"
  end
end
