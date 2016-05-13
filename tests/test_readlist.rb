require '..\lib\readlist.rb'
require "test/unit"

class TestReadList < Test::Unit::TestCase

  def test_sort_by_length
    readed = ReadList.new
    assert_equal("pneumonoultramicroscopicsilicovolcanoconioses", readed.sort_by_length.last)
  end

end
