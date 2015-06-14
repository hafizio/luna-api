class SendMessageJob < ActiveJob::Base
  queue_as :default

  def perform(msg_id, sender_score)
    candidates = User.where(score: sender_score).pluck(:id)
    candidates[rand(candidates.length -1)]
  end
end
