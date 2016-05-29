require '.\human.rb'
require '.\computer.rb'

class Board
  attr_accessor :secret_word, :missed, :length, :human, :computer

  def initialize(secret_word)
    @secret_word = secret_word
    @length = secret_word.length
    @computer = Computer.new(length)
    @human = Human.new(secret_word)
    @missed = @human.missed
    print_current_result
  end

  def print_current_result
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts File.open("../data/missed#{missed.count}.txt", 'r').read
    puts "Guessed: #{human.guessed.join}"
    puts "Missed: #{missed.join(", ")}"
  end

  def game
    while missed.count !=6
      guess = computer.guess
      human.do_we_have_char(guess)
      if !human.guessed.include?('_')
        print_current_result
        puts 'Computer is a winner'
        puts "Secret word was #{human.guessed.join}"
        break
      end
      print "Computer is thinking"
      4.times do
      sleep 1
      print "."
      end
      print guess
      sleep 1
      print_current_result
      computer.guessed = human.guessed
      computer.missed = human.missed
    end
    if missed.count == 6
      puts "You are the winner! Computer didn't managed to guess your secret word #{secret_word}"
    end
  end
end

input = 1
while input != "x"
  puts "Please enter a secret word for computer to guess"
  word = gets.chomp
  Board.new(word).game
  puts 'Press "x" to exit, or press "n" for new game'
  input = gets.chomp
end
