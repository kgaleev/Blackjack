# frozen_string_literal: true

# What's your name? (if Tony - Fuck you, Tony! Get your stinky ass to the table)

# two classes: Dealer (ai) & Player (user)
# class Deck with cards as instances (objects). Shuffle method for not creating new deck every round. Deck as array

# game:
# 1. player picks name (gets)
# 2. both start with 100$ (init) (integer, don't need money as different object)
# 3. player gets 2 cards, opened to player (deck arr: rand, sample, shuffle) (deck class, instance created once, shuffled each round)
# 4. dealer gets 2 cards, closed to player (Card can be Struct)
# 5. player knows his points: 2-10 = same num, pictures = 10, ace = 1 or 11 (closest to 21 or lowest to 21+) (objects added from deck through << and points taken from object)
# 6. player and dealer put 10$ in bank (-10, +10)
# 7. player's turn with 3 choices: skip, add 1 card, open hand (round ends)
# 8. dealer's turn with 2 choices: skip (if points>=17), add 1 card (if points<17)
# 9. hands are opened, if both have 3 cards or if player chooses to open hand (max hand is 3 cards)
# 10. game results shown: closest to 21 wins; if player has >21, he loses; if equal points - round draw
# 11. winner gets money from bank
# 12. ask player if he wants 1 more round or end game

# add condition to stop game, when player's or dealer's funds == 0

require_relative 'game'
# require_relative 'menu'
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'

# player=Player.new(game.name)
# puts player.inspect
# dealer=Dealer.new
# puts dealer.inspect
# deck = Deck.new
# deck.ptc
# deck.shuffle
# player.draw_two(deck)
# dealer.draw_two(deck)
# game.player.choose
# dealer.draw_one(deck)
# dealer.draw_two(deck)

game = Game.new
game.greeting
game.deck # needed for .shuffle to work in .new_round
loop do
game.new_round
game.player.draw_two(game.deck)
game.player.beautiful_cards
game.dealer.draw_two(game.deck)
game.player.current_score
game.player.place_bet
game.dealer.place_bet
# maybe loop with if is shorter, need to try
until game.choice.to_i == 3 || (game.player.cards.length == 3 && game.dealer.cards.length == 3)
game.choose
end
if game.player.cards.length == 3 && game.dealer.cards.length == 3
  # print "Player cards: "
  game.player.beautiful_cards
  # game.player.cards.each {|card| print card.rank + card.suit + " "}; puts
  # print "Dealer cards: "
  game.dealer.beautiful_cards
  # game.dealer.cards.each {|card| print card.rank + card.suit + " "}; puts
end

if game.player.current_score > game.dealer.current_score && game.player.current_score <= 21
  puts "Player wins"
  game.player.win_bet
elsif game.player.current_score < game.dealer.current_score && game.dealer.current_score <= 21
  puts "Dealer wins"
  game.dealer.win_bet
elsif game.player.current_score == game.dealer.current_score
  puts 'Tie ¯\_( ͡❛ ͜ʖ ͡❛)_/¯ land'
  game.player.draw_bet
  game.dealer.draw_bet
else
  puts "Dealer wins"
  game.dealer.win_bet
end
# binding.irb
break if game.player.balance < 10 || game.dealer.balance < 10
end
# binding.irb
# game.choose
# game.dealer.current_score

# binding.irb