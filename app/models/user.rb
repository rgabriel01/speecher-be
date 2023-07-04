class User < ApplicationRecord
  has_many :speeches

  validates :email, :first_name, :family_name, presence: true
end
