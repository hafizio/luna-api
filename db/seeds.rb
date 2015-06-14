(1..100).each do |n|
  User.create(aim_id: "angelhack_#{n}", score: n)
end

User.create(aim_id: 'angelhack')
User.create(aim_id: 'hackangel')

# sad user
User.first.messages.create(content: 'I am sad')

# happy user
User.last.messages.create(content: 'I am happy')
