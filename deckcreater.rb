class DeckCreater

  def new_deck(decks)
    print "What should the deck be called? (Names must be unique)\n> "
    name = gets.chomp
    while decks.keys.include?(name) || name !~ /[a-zA-Z0-9]/ || MenuSelector::OPTIONS.include?(name)
      print "Invalid deck name, please enter new name.\n> "
      name = gets.chomp
    end
    new_deck = Deck.new(name)
    adding = true
    while adding
      puts "Please enter text for the front of the card:"
      print "> "
      front = gets.chomp
      puts "Please enter text for the back of the card:"
      print "> "
      back = gets.chomp
      new_card = Card.new(front,back)
      new_deck.add_card(new_card)
      adding = adding_more_cards?
    end
    decks[name] = new_deck
    decks
  end

  def adding_more_cards?
    puts "Add another card? (y/n): "
    print "> "
    answer = gets.chomp.downcase
    if answer != 'n' and answer != 'y'
      puts "Please enter 'y' or 'n'.\n\n"
      return adding_more_cards?
    end
    return false if answer == 'n'
    true
  end

end
