require 'json'
require_relative 'card'
require_relative 'deck'
require_relative 'deckreader'
require_relative 'deckwriter'

reader = DeckReader.new
decks = reader.decks

while true
  break
end

writer = DeckWriter.new(decks)
writer.write_decks
