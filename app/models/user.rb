class User < ApplicationRecord
    has_secure_password
  
    has_many :leads
    has_many :companies, through: :leads
  
    validates :email, uniqueness: { case_sensitive: false }
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :email, presence: true
  end