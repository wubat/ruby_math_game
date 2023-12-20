require_relative "player.rb"

class MathGame
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = num1 + num2
    "waht does #{num1} plus #{num2} equal?"
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def play
    puts "----- NEW GAME -----"
    while @player1.lives > 0 && @player2.lives > 0
      puts "----- NEW TURN -----"
      puts "Player 1: #{generate_question}"
      print '>'
      user_answer = gets.chomp.to_i

      if user_answer == @answer
        puts "Player 1: Correct! nice!"
      else
        puts "Player 1: Wrong answer, sorry"
        @current_player.lose_life
    end

    puts "P1 lives: #{@player1.lives}/3 vs P2 lives: #{@player2.lives}/3"
    switch_player
  end

    puts "----- GAME OVER -----"
    if @player2.lives == 0
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    elsif  @player1.lives == 0
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    end
    puts "GOODBYE!"
  end

end

