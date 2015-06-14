class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :conversation

  after_create :nlp

  private

  def nlp
    self.update(MessageRankingService.new(self.sender_id, self.content).call)
    score = Message.where(sender_id: self.sender_id).sum(:point)
    self.sender.update(score: score)
    #SendMessageJob.perform_later(self.id, self.sender_id)
  end
end
