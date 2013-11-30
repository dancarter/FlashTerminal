class DeckWriter

  def initialize(decks)
    @decks = decks
  end

  def write_decks
    File.open("decks.yaml", 'w') do |out|
      YAML.dump(@decks, out)
    end
  end

end
