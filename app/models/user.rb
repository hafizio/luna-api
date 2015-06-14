class User < ActiveRecord::Base
  has_many :conversations
  has_many :messages, foreign_key: :sender_id
  has_many :inbox, class_name: 'Message', foreign_key: :recipient_id

  after_touch :update_candidates

  def sum_score
    messages.sum(:point)
  end

  def update_candidates
    candidates = User.where(score: sender_score).pluck(:id)
    self.update(candidates: candidates)
  end
end
