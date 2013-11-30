class Reviewer

  def initialize(deck)
    @deck = deck
  end

  def begin_review
    print "How many cards will you review?\n> "
    num_cards = gets.chomp
    if num_cards =~ /\D/ || num_cards.to_i < 1 || num_cards.to_i > @deck.num_of_cards
      puts "Invalid input.\n\n"
      begin_review
    else
      @deck.review(num_cards.to_i).each_with_index do |card,index|
        system "clear" unless system "cls"
        show_side(card.front,index+1)
        show_side(card.back,index+1)
      end
    end
  end

  def show_side(text,index)
    text = text.scan(/.{1,44}/m)
    puts "    Card #{index}"
    puts "    ++++++++++++++++++++++++++++++++++++++++++++\n\n\n\n"
    text.each do |line|
      puts "    #{line}"
    end
    puts "\n\n\n    ++++++++++++++++++++++++++++++++++++++++++++"
    gets
    system "clear" unless system "cls"
  end

end
