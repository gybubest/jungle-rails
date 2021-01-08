class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
end
