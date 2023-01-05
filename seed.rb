# frozen_string_literal: true

class Game

  # attr_reader :name
  def welcome
    puts "Welcome to the club, buddy!"
    # puts "What's your name?"
    # name = gets.chomp
    # @name = name
  end

end

Game.new.welcome
#puts "Welcome to the club, buddy!"
# What's your name? (if Tony - Fuck you, Tony! Get your stinky ass to the table)

#put it (^v) as method in Player class
# puts "What's your name?"
# name = gets.chomp

# two classes: Dealer (ai) & Player (user)
# class Deck with cards as instances (objects). Shuffle method for not creating new deck every round. Deck as array

# game:
# 1. player picks name (gets)
# 2. both start with 100$ (init) (integer, don't need money as object) (module round: start, results)
# 3. player gets 2 cards, opened to player (deck arr: rand, sample, shuffle) (deck class, instance created once, shuffle each round)
# 4. dealer gets 2 cards, closed to player
# 5. player knows his points: 2-10 = same num, pictures = 10, ace = 1 or 11 (closest to 21 or lowest to 21+) (objects added from deck through << and points taken from object)
# 6. player and dealer put 10$ in bank (-10, +10; Bank as Struct)
# 7. player's turn with 3 choices: skip, add 1 card, open hand (round ends)
# 8. dealer's turn with 2 choises: skip (if points>17), add 1 card (if points<17)
# 9. hands are opened, if both have 3 cards or if player chooses to open hand (max hand is 3 cards)
# 10. game results shown: closest to 21 wins; if player has >21, he loses; if equal points - round draw
# 11. winner gets money from bank
# 12. ask player if he wants 1 more round or end game
#
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'

p=Player.new
puts p.inspect
d=Dealer.new
puts d.inspect

de = Deck.new
de.ptc
de.shuffle
puts de.deck.length

p.draw_one(de)
p.draw_two(de)
puts p.cards
p.current_score

d.draw_one(de)
d.draw_two(de)
puts d.current_score