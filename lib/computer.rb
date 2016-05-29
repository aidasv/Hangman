require '.\readlist.rb'

class Computer
  attr_accessor :length, :most_common, :guessed_arr, :words, :guessed, :missed

  def initialize(length)
    @length = length
    @guessed = Array.new(length, '_')
    @missed = []
    @words = ReadList.new.sort_by_length.select { |word| word.length == length}
  end

  def possible_words
    if missed.any?
    @words = words.select { |word| !word.include?(missed.last)}
    end
    @guessed_arr = []
    guessed.each { |char| @guessed_arr << char if char != "_"}
    guessed_indexes = []
    guessed.each_index { |x| guessed_indexes << x if @guessed[x] != "_"}
    guessed_indexes.each do |index|
      @words = words.select { |word| word.split('')[index] == guessed[index]}
    end
    guessed_hsh = Hash.new(0)
    guessed_arr.each { |char| guessed_hsh[char] +=1 }
    guessed_hsh.each { |k, v| @words = words.select { |word| word.count(k) == v}}
    words
  end

  def most_common_chars
    @most_common = Hash.new(0)
    possible_words.join.split('').each do |char|
      @most_common[char] += 1
    end
    @most_common = most_common.sort_by { |k, v| v}.reverse
    most_common
    most_common_arr = []
    most_common.each { |arr| most_common_arr << arr[0]}
    most_common_arr = most_common_arr - guessed_arr
  end

  def guess
    most_common_chars[0]
  end

end
