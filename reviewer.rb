class Reviewer
  def initialize(deck)
    binding.pry
    @deck = deck
  end

  def begin_review
    puts @deck.review(1)
  end
end
