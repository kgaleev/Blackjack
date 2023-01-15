# frozen_string_literal: true

class Game

  attr_reader :name, :choice

  def deck
    @deck ||= Deck.new # need only one deck
  end

  def new_round
    puts "New round"
    @deck.shuffle
    player.class.draw_index = 0
    player.cards = []
    dealer.cards = []
    @choice = nil # else @choice is saved from previous round and makes infinite loop
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

  def choose # player doesn't have choose method (can't be game.player.choose), so it goes just to Game class
    menu = ["1. draw card", "2. skip", "3. open hand"]
    puts menu
    choice = gets.chomp
    @choice = choice
    case @choice
    when '1'
      player.draw_one(deck)
      # sleep 2
      dealer.make_turn(deck)
    when '2'
      puts "Dealer's turn"
      dealer.make_turn(deck)
    when '3'
      puts player.cards.inspect
      puts dealer.cards.inspect
    # when '1'
    #   draw_one(deck)
    # when '2'
    #   puts "Dealer's turn"
    #   dealer.make_turn(deck)
    # when '3'
    #   puts cards.inspect
    #   puts dealer.cards.inspect
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
dealer.make_turn

binding.irb

# delete case-when from module, make case-when in game class with: when 1; player.draw_one(deck)
=end