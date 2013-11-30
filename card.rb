class Card
  attr_reader :front,:back

  def initialize(front,back)
    @front = front
    @back = back
  end

  def to_s
    puts "Front: #{@front}"
    puts "Back : #{@back}"
  end

end
