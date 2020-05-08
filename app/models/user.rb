class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  MINIMUM_NICKNAME_LENGTH = 4
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :trackable, :lockable, :confirmable, :registerable
  
  has_friendship
  has_many :torrents

  validates :nickname, presence: true, uniqueness: true, length: { minimum: MINIMUM_NICKNAME_LENGTH }
  validate :membership_validity


  private

  def membership_validity
    unless RegistrationMembership.accepted.find_by_email(email)
      errors.add(:email, "n'a pas été autorisé !")
    end
  end
end
