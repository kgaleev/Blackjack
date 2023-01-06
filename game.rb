# frozen_string_literal: true

class Game

  attr_reader :name, :choice

  def deck
    @deck ||= Deck.new # need only one deck
  end

  def new_round
    @deck.shuffle
    player.class.draw_index=0
    player.cards=[]
  end

  def greeting
    puts "Welcome to the club, buddy!"
    puts "What's your name?"
    name = gets.chomp
    @name = name.capitalize
  end

  def player
    @player ||= Player.new(name)
    # puts @player.inspect
  end
  def dealer
    @dealer ||= Dealer.new
    # puts @dealer.inspect
  end

  def choose
    menu = ["1. draw card", "2. skip", "3. open hand"]
    puts menu
    choice = gets.chomp
    @choice = choice
    case @choice
    when '1'
      self.draw_one(cards)
    when '2'
      puts "#{self.name}'s turn"
    when '3'
      self.cards
    end
  end

end

require_relative 'game'
require_relative 'menu'
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'

=begin
# 1. player picks name (gets)
game = Game.new
game.greeting

# 2. both start with 100$
player=Player.new(game.name)
#puts player.inspect
dealer=Dealer.new
#puts dealer.inspect

# 3. player gets 2 cards, opened to player
# deck = Deck.new
# deck.ptc
# deck.shuffle
#puts deck.deck.length

player.draw_two(game.deck)
puts player.cards.inspect

# 4. dealer gets 2 cards, closed to player
dealer.draw_two(deck)

# 5. player knows his points
player.current_score

# 6. player and dealer put 10$ in bank
player.place_bet
dealer.place_bet

# 7. player's turn with 3 choices: skip, add 1 card, open hand (round ends)
player.choose

#8. dealer's turn with 2 choices: skip (if points>=17), add 1 card (if points<17)

binding.irb

# delete case-when from module, make case-when in game class with: when 1; player.draw_one(deck)
=end