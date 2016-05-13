require '..\lib\computer.rb'

class Human
  attr_accessor :secret_word, :guessed, :missed

  def initialize(secret_word)
    @secret_word = secret_word
    @guessed = 0
  end

  def get_letter
    game = Computer.new(secret_word)
    game.guess
  end

end

puts Human.new("cat").get_letter
