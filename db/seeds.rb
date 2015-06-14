(1..100).each do |n|
  User.create(aim_id: "angelhack_#{n}", score: n)
end

User.create(aim_id: 'angelhack')
User.create(aim_id: 'hackangel')

# conversations
User.first.conversations.create

# sad user
User.first.messages.create(conversation_id: Conversation.first.id, content: 'I am sad')

# happy user
User.last.messages.create(conversation_id: Conversation.first.id, content: 'I am happy')
