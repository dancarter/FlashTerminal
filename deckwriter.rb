class DeckWriter

  def initialize(decks)
    @decks = decks
  end

  def write_decks
    File.open("decks.json",'w') do |log|
      log.write(JSON.generate(@decks))
    end
  end

end
