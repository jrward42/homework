require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new([])}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, index|
      4.times do
        cup << :stone unless index == 6 || index == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos<=0|| start_pos>13
  end

  def make_move(start_pos, current_player_name)
    current_index = start_pos
    @cups[start_pos].each do |stone|
      current_index = loop_around(current_index, 1)
      if opponent_store(current_index, current_player_name)
        current_index=loop_around(current_index, 1)
      end
      @cups[current_index]<< stone
    end
    @cups[start_pos]=[]


    puts render
    next_turn(current_index, current_player_name)
  end

  def loop_around(pos, add)
    (pos+add)%13
  end

  def opponent_store(player_name, pos)
    stores = {@player1=>6,@player2=>13}
    if player_name = @player1
      pos == stores[@player2]
    else
      pos == stores[@player1]
    end
  end

  def current_player_cup(player_name, pos)
    stores = {@player1=>6,@player2=>13}
    if player_name = @player1
      pos == stores[@player1]
    else
      pos == stores[@player2]
    end
  end

  def next_turn(ending_cup_idx, player_name)
    # helper method to determine what #make_move returns
    #debugger
    if current_player_cup(ending_cup_idx, player_name)
      return :switch
    elsif @cups[ending_cup_idx].length == 1
      return :prompt
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
  end

  def winner
  end
end
