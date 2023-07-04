class Speech < ApplicationRecord
  belongs_to :user

  validates :title,
            :body,
            :user_id,
            :date,
            presence: true

  scope :active, ->  { where(deleted: false) }
end
