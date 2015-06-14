class Conversation < ActiveRecord::Base
  attr_accessor :aim_id
  belongs_to :sender, class_name: 'User', foreign_key: :senderID
  has_many :messages
end
