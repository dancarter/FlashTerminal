class MenuSelector
  attr_reader :decks
  OPTIONS = ['done','delete','new','edit']

  def initialize(decks)
    @decks = decks.nil? ? {} : decks
    @reviewing = true
  end

  def menu
    puts "Decks--------------------------------"
    @decks.each_key do |name|
      puts "#{name}"
    end
    puts "No decks made yet!" if @decks.size == 0
    puts "-------------------------------------"
    puts "Type 'new' to create a new deck"
    puts "Type 'delete (name)' to delete a deck"
    puts "Type 'edit (name)' to edit a deck"
    puts "Type 'done' to exit the program"
    print "Enter the name of a deck to review\n> "
  end

  def perform_menu_selection
    option = gets.chomp
    if !good_menu_choice?(option.split(" ")[0])
      print "Invalid selection.\n> "
      perform_menu_selection
    elsif option.downcase == 'new'
      create_deck
    elsif option.downcase.include?('delete')
      delete_deck(option)
    elsif option.downcase.include?('edit')
      edit_deck(option)
    elsif option.downcase == 'done'
      @reviewing = false
    else
      review(option)
    end
  end

  def review(option)
    reviewer = Reviewer.new(@decks[option])
    reviewer.begin_review
  end

  def create_deck
    creater = DeckCreater.new
    @decks = creater.new_deck(@decks)
  end

  def delete_deck(option)
    deck_name = option.split(" ")[1,option.size-1].join(" ")
    if @decks.keys.include?(deck_name)
      puts "'#{deck_name}' has been deleted."
      @decks.delete(deck_name)
    else
      puts "Deck '#{deck_name}' was not found."
    end
    gets
  end

  def edit_deck(option)
    deck_name = option.split(" ")[1,option.size-1].join(" ")
    if @decks.keys.include?(deck_name)
      editor = DeckEditor.new(@decks[deck_name])
      @decks[deck_name] = editor.edit
    else
      puts "Deck '#{deck_name}' was not found."
      gets
    end
  end

  def good_menu_choice?(choice)
    return false if choice.nil?
    return true if @decks.keys.include?(choice) || OPTIONS.include?(choice.downcase)
    false
  end

  def reviewing?
    @reviewing
  end

end
