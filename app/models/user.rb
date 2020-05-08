class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :trackable, :lockable, :confirmable, :registerable
  
  has_friendship
  has_many :torrents
  
  validate :membership_validity

  def membership_validity
    unless RegistrationMembership.accepted.find_by_email(email)
      errors.add(:email, "n'a pas été autorisé !")
    end
  end
end
