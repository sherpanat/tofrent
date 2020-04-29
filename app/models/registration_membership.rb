class RegistrationMembership < ApplicationRecord
  enum status: [ :pending, :accepted, :refused ]

  validates :email, :status, presence: true
  validates_format_of :email, with: Devise.email_regexp, on: :create
end
