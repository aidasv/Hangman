class ReadList
  attr_accessor :file, :list, :sorted

  def initialize
    file = File.open('..\data\wordlist.txt', 'r')
    @list = []
    file.each_line do |line|
      @list << line.chomp
    end
  end

  def sort_by_length
    @sorted = @list.sort_by { |x| x.length}
    end

end
