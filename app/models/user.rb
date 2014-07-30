class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments


  def self.search(search)
    if search
       where("name like ? OR city like ? OR created_at like ?", "%#{search}%","%#{search}%","%#{search}%") 
    end
  end
end
