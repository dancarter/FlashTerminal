class Deck
  attr_reader :name

  def initialize(name)
    @name = name
    @deck = []
  end

  def add_card(card)
    @deck << card
  end

  def review(num_to_review)
    @deck.sample(num_to_review)
  end
end
