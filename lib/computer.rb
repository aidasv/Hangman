require '..\lib\readlist.rb'
require 'pry'

class Computer
  attr_accessor :same_length, :length, :most_common, :guesses

  def initialize(word)
    @length = word.length
    @same_length = []
    @most_common = Hash.new(0)
    @guesses = -1
    most_common_chars
  end
  def same_length
    words = ReadList.new.sort_by_length
    words.select { |word| word.length == length}

  end

  def most_common_chars
    same_length.join.split('').each do |char|
      @most_common[char] += 1
    end
    @most_common = @most_common.sort_by { |k, v| v}.reverse
  end

  def guess
    @guesses += 1
    puts most_common[guesses][0]
  end

end


#a = Computer.new("cat")
#a.guess
#a.guess
