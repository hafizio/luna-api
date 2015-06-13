class MessageRankingService
  def initialize(user_id, text)
    @user = user_id
    @text = text.split
    @message = {}
    @message[:text] = text
  end

  def call
    @message[:point] = point
    @message
  end

  def point
    values = $brain.classify(@text)
    if values['POSITIVE'] > values['NEGATIVE']
      1
    else
      -1
    end
  end
end
