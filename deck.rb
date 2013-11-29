class Deck

  def initialize
    @deck = []
  end

  def add_card(card)
    @deck << card
  end

  def review(num_to_review)
    @deck.sample(num_to_review)
  end
end
