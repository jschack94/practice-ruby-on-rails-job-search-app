class Company < ApplicationRecord
    has_many :leads
    has_many :users, through: :leads
  
    validates :name, presence: true
  end
