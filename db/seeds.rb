Torrent.destroy_all
User.destroy_all

puts "Create 6 users with..."
6.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "12345678",
    nickname: Faker::JapaneseMedia::DragonBall.character
  )

  p "with 2 torrents..."
  2.times do
    Torrent.create!(
      owner: user,
      source: :handmade,
      title: Faker::Book.title,
      description: Faker::Lorem.paragraphs(number: rand(1..3)),
      visibility: :friends
    )
  end
end
p "done."

puts "Create friendships..."
User.all.each do |user|
  users = User.where.not(id: user.id)
  3.times do
    friend = users.sample
    unless user.friends_with?(friend)
      user.friend_request(friend)
      friend.accept_request(user)
    end
    users = users.where.not(id: friend.id)
  end
end
p "done."
