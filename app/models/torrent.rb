class Torrent < ApplicationRecord
  has_flags :visible
  belongs_to :owner, foreign_key: :user_id
  belongs_to :friend, foreign_key: :user_id, optional: true 

  enum source: [ :handmade, :shared ]
  enum visibility: [ :a_friend, :friends, :public ]
end
