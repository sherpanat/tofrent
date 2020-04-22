class Torrent < ApplicationRecord
  has_flags :visible
  has_one_attached :torrent_file

  belongs_to :owner, class_name: 'User'
  belongs_to :friend, class_name: 'User', optional: true

  enum source: [ :handmade, :shared ]
  enum visibility: [ :a_friend, :friends, :everyone ]
end
