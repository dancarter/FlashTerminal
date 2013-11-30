class DeckWriter

  def initialize(decks)
    @decks = decks
  end

  def write_decks
    File.open("decks.json",'w') do |log|
      decks = JSON.generate(@decks)
      binding.pry
      log.write(JSON.generate(decks))
    end
  end

end
