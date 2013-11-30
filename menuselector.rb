class MenuSelector
  attr_reader :decks

  def initialize(decks)
    @decks = decks.nil? ? {} : decks
    @reviewing = true
  end

  def menu
    @decks.each do |name|
      puts "#{name}"
    end
    puts "Type 'new' to create a new deck"
    puts "Type 'done to exit the program"
  end

  def perform_menu_selection
    print "Enter name of deck to review:\n> "
    option = gets.chomp
    if !good_menu_choice?(option)
      puts "Invalid menu selection."
      perform_menu_selection
    elsif option.downcase == 'new'
      create_deck
    elsif option.downcase == 'done'
      @reviewing = false
    else
      review(option.to_i)
    end
  end

  def review(choice)
    reviewer = Reviewer.new(@decks[choice])
    reviewer.begin_review
  end

  def create_deck
    creater = DeckCreater.new
    @decks = creater.new_deck(@decks)
  end

  def good_menu_choice?(choice)
    return true if @decks.keys.include?(choice) || choice.downcase == 'new' || choice.downcase == 'done'
    false
  end

  def reviewing?
    @reviewing
  end

end
