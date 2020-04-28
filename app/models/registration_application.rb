class RegistrationApplication < ApplicationRecord
  enum status: [ :pending, :accepted, :refused ]

  validates :email, :status, presence: true
end
