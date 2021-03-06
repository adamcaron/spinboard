class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates_confirmation_of :password

  has_many :links
end
