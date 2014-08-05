class Category < ActiveRecord::Base
  has_many :posts, dependent:  :destroy
  validates :name, uniqueness: true, length: { minimum: 5 }
end
