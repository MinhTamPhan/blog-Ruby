class Account < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :email, presence: true
  validates :fullname, presence: true
  validates :password, presence: true, confirmation: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
