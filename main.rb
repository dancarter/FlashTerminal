require 'yaml'
require_relative 'card'
require_relative 'deck'
require_relative 'deckreader'
require_relative 'deckwriter'
require_relative 'menuselector'
require_relative 'reviewer'
require_relative 'deckcreater'
require_relative 'deckeditor'

reader = DeckReader.new
writer = DeckWriter.new
selector = MenuSelector.new(reader.decks)

while selector.reviewing?
  system "clear" unless system "cls"
  selector.menu
  selector.perform_menu_selection
  writer.set_decks(selector.decks)
  writer.write_decks
end

system "clear" unless system "cls"
