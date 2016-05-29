require '..\lib\computer.rb'
require "test/unit"

class TestComputer < Test::Unit::TestCase

  def test_same_length
    length = Computer.new(10)
  end
