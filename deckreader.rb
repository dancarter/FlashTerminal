class DeckReader
  attr_reader :decks

  def initialize
    if File.exists?('decks.yaml') && !File.zero?("decks.yaml")
      read_decks
    else
      @decks = {}
    end
  end

  def read_decks
    decks = File.open( 'decks.yaml', 'r') { |yam| loaded = YAML.load( yam ) }
    @decks = decks.map{ |pair| Hash[*pair] }.reduce Hash.new, :merge
  end

end
