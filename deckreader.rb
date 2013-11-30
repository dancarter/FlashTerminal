class DeckReader
  attr_reader :decks

  def initialize
    if File.exists?('decks.json') && !File.zero?("decks.json")
      read_decks
    else
      @decks = {}
    end
  end

  def read_decks
    @decks = JSON.parse( IO.read("decks.json") )
  end

end
