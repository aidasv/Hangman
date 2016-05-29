class Human
  attr_accessor :secret_word, :secret_word_arr, :guessed, :missed

  def initialize(secret_word)
    @secret_word = secret_word
    @secret_word_arr = secret_word.split('')
    @guessed = Array.new(secret_word.length, '_')
    @missed = []
  end

  def do_we_have_char(char)
    if secret_word.include?(char)
      secret_word_arr.each_index do |x|
        if secret_word_arr[x] == char
          @guessed[x] = char
        end
      end
      else
        @missed << char
      end
  end
end
