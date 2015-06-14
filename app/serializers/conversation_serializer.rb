class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :messages
end
