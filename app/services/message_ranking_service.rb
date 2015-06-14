class MessageRankingService
  def initialize(user_id, text)
    @user = user_id
    @text = text
    @message = {}
    @message[:content] = text
  end

  def call
    @message[:point] = point
    @message
  end

  def process
    tgr = EngTagger.new
    tagged = tgr.add_tags(@text)
    noun = tgr.get_nouns(tagged).keys
    adj = tgr.get_adjectives(tagged).keys
    @text = noun + adj
  end

  def point
    process
    values = $brain.classify(@text)
    if values['POSITIVE'] > values['NEGATIVE']
      1
    else
      -1
    end
  end
end
