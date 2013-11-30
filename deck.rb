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

  def num_of_cards
    @deck.size
  end

  def show_cards
    @deck.each_with_index do |card,index|
      puts "Card #{index+1}:"
      puts card.to_s
    end
  end

  def delete_card(index)
    puts "Card at index #{index} deleted."
    @deck.delete_at(index-1)
  end

  def select_confidence(confidence)
    @deck.select { |card| card.confidence == confidence }
  end

end
