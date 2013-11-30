require 'pry'
require 'yaml'
require_relative 'card'
require_relative 'deck'
require_relative 'deckreader'
require_relative 'deckwriter'
require_relative 'menuselector'
require_relative 'reviewer'
require_relative 'deckcreater'

reader = DeckReader.new
selector = MenuSelector.new(reader.decks)

while selector.reviewing?
  system "clear" unless system "cls"
  selector.menu
  selector.perform_menu_selection
  sleep(1)
end

writer = DeckWriter.new(selector.decks)
writer.write_decks
