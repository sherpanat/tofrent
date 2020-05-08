class RegistrationMembership < ApplicationRecord
  enum status: { pending: 0, accepted: 1, refused: 2 }

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise.email_regexp, on: :create
end
