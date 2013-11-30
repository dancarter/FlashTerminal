class DeckEditor

  def initialize(deck)
    @deck = deck
  end

  def edit
    system "clear" unless system "cls"
    @deck.show_cards
    puts "Type 'r' to remove a card."
    puts "Type 'a' to add a card"
    print "Type 'done' when finished.\n> "
    option = gets.chomp
    if option == 'r'
      remove
      return edit
    elsif option == 'a'
      add
      return edit
    elsif option == 'done'
      return @deck
    else
      puts "Invalid selection."
      return edit
    end
  end

  def remove
    if @deck.num_of_cards == 0
      puts "No cards to remove!"
      gets
      return nil
    end
    print "Enter the number of the card you would like to remove.\n> "
    card_num = gets.chomp
    if card_num =~ /\D/ || card_num.to_i < 1 || card_num.to_i > @deck.num_of_cards
      puts "Invalid selection."
    else
      @deck.delete_card(card_num.to_i)
    end
  end

  def add
    puts "Please enter text for the front of the card:"
    print "> "
    front = gets.chomp
    puts "Please enter text for the back of the card:"
    print "> "
    back = gets.chomp
    new_card = Card.new(front,back)
    @deck.add_card(new_card)
  end

end
