class Reviewer

  def initialize(deck)
    @deck = deck
  end

  def begin_review
    print "Enter 'a' to review by amount, 'c' to review by confidence:\n> "
    option = gets.chomp
    if option.nil?
      puts "Invalid selection."
      begin_review
    elsif option.downcase == 'a'
      review_by_amount
    elsif option.downcase == 'c'
      review_by_confidence
    else
      puts "Invalid selection."
      begin_review
    end
  end

  def review_by_confidence
    print "What confidence level will you review?(1-3)\n> "
    confidence = gets.chomp
    while !valid_confidence?(confidence)
      print "Please enter a confidence from 1-3:\n> "
      confidence = gets.chomp
    end
    set = @deck.select_confidence(confidence)
    if set.size == 0
      puts "No cards of that confidence level found."
      gets
    else
      review_set(set)
    end
  end

  def review_by_amount
    print "How many cards will you review?\n> "
    num_cards = gets.chomp
    if !valid_num_cards?(num_cards)
      puts "Invalid input.\n\n"
      begin_review
    else
      review_set(@deck.review(num_cards.to_i))
    end
  end

  def review_set(cards)
    cards.each_with_index do |card,index|
      system "clear" unless system "cls"
      show_side(card.front,index+1)
      gets
      system "clear" unless system "cls"
      show_side(card.back,index+1)
      print "Please enter card confidence(1-3):\n> "
      conf = gets.chomp
      while !valid_confidence?(conf)
        print "Please enter a confidence from 1-3:\n> "
        conf = gets.chomp
      end
      card.set_confidence(conf)
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
  end

  def valid_num_cards?(num_cards)
    num_cards !~ /\D/ && num_cards.to_i >= 1 && num_cards.to_i <= @deck.num_of_cards
  end

  def valid_confidence?(confidence)
    confidence !~ /\D/ && confidence.to_i >= 1 && confidence.to_i <= 3
  end

end
