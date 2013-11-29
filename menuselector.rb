class MenuSelector
  attr_reader :decks

  def initialize(decks)
    @decks = decks.nil? ? [] : decks
    @reviewing = true
  end

  def menu
    @decks.each_with_index do |deck,index|
      puts "#{index+1}.) #{deck.name}"
    end
    puts "#{@decks.size+1}.) New Deck"
    puts "#{@decks.size+2}.) Close program"
  end

  def perform_menu_selection
    puts "Select option number: "
    print "> "
    option = gets.chomp
    if !good_menu_choice?(option)
      puts "Invalid menu selection."
      perform_menu_selection
    elsif option.to_i == @decks.size + 1
      create_deck
    elsif option.to_i == @decks.size + 2
      @reviewing = false
    else
      review(option.to_i)
    end
  end

  def review(choice)
    reviewer = Reviewer.new(@decks[choice-1])
    reviewer.begin_review
  end

  def create_deck
    creater = DeckCreater.new
    @decks << creater.new_deck
  end

  def good_menu_choice?(choice)
    return false if choice =~ /\D/ || choice.to_i < 1 || choice.to_i > @decks.size + 2
    true
  end

  def reviewing?
    @reviewing
  end

end
