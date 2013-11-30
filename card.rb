class Card
  attr_reader :front,:back,:confidence

  def initialize(front,back)
    @front = front
    @back = back
    @confidence = 0
  end

  def to_s
    puts "Front: #{@front}"
    puts "Back : #{@back}"
  end

  def set_confidence(confidence)
    @confidence = confidence
  end

end
