class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-z\d]([\.\w\d\-]+)?[a-z\d]@[a-z\d]([a-z\d\-\.]+)?[a-z\d]\.[a-z]+\z/.freeze
  has_many :speeches

  validates :email,
            :first_name,
            :last_name,
            presence: true

  validates :email,
            format: {
              with: EMAIL_FORMAT,
              message: 'must be of valid format'
            }
end
