class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true

  has_many :pictures
  has_many :comments
end
