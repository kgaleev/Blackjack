# frozen_string_literal: true

module Menu

  attr_reader :choice
  def choose
    menu = ["1. draw card", "2. skip", "3. open hand"]
    puts menu
    choice = gets.chomp
    @choice = choice
    case @choice
    when '1'
      self.draw_one(ObjectSpace.each_object(Deck).to_a[0]) # if i want module to see object from other class (where module isn't included), need to put that object somewhere
    when '2'
      puts "Dealer's turn"
    when '3'
      self.cards.each {|card| puts card.inspect}
    end
  end
end