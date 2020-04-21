class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :trackable, :lockable, :confirmable
  
  has_friendship
  has_many :torrents
end
