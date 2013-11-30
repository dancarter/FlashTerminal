class Reviewer
  def initialize(deck)
    @deck = deck
  end

  def begin_review
    puts @deck.review(1)
  end
end
