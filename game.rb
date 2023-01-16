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
    name = gets.chomp; puts
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

  def choose # player doesn't have choose method (can't be game.player.choose), so it goes straight to the Game class
    menu = ["1. draw card", "2. skip", "3. open hand"]
    puts "actions:"
    puts menu
    choice = gets.chomp; puts
    @choice = choice
    case @choice
    when '1'
      player.draw_one(deck)
      player.beautiful_cards
      player.current_score
      # sleep 2
      dealer.make_turn(deck)
    when '2'
      puts "#{dealer.name}'s turn"
      dealer.make_turn(deck)
    when '3'
      player.beautiful_cards
      player.current_score
      puts
      dealer.beautiful_cards
      dealer.current_score
      # puts player.cards.inspect
      # puts dealer.cards.inspect

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

  def balance
    puts "#{player.name}'s balance: #{player.balance}"
    puts "#{dealer.name}'s balance: #{dealer.balance}"; puts
  end

  def another_round_menu
    menu = ["1. play again", "2. end game"]
    puts "actions: "
    puts menu
    answer = gets.chomp; puts

    case answer
    when "1"
      new_round
    when "2"
      exit
    else
      another_round_menu
    end

    # if same method with x=gets in unless and there's NO instance variable: until x == ... another_round_menu; end
    # -- need break before 'end' to get out of the loop, else stuck in infinite loop with wrong x input from first cycle

    # if same method with x=gets in unless and there IS instance variable: until @x == ... another_round_menu; end
    # -- don't need break before 'end' to get out of the loop, first cycle sees same @x as nested cycle

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