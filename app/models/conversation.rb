class Conversation < ActiveRecord::Base
  attr_accessor :aim_id
  belongs_to :user
  has_many :messages
end
