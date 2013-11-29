class DeckCreater
  def new_deck
    puts "What should the deck be called?"
    print "> "
    name = gets.chomp
    new_deck = Deck.new(name)
    while adding_cards?
      puts "Please enter text for the front of the card:"
      print "> "
      front = gets.chomp
      puts "Please enter text for the back of the card:"
      print "> "
      back = gets.chomp
      new_card = Card.new(front,back)
      new_deck << new_card
    end
    new_deck
  end

  def adding_cards?
    puts "Add another card? (y/n): "
    print "> "
    answer = gets.chomp.downcase
    if answer != 'n' and answer != 'y'
      puts "Please enter 'y' or 'n'.\n\n"
      return adding_cards?
    end
    return false if answer == 'n'
    true
end
