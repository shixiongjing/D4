require 'minitest/autorun'
require_relative 'net'

class HelperMethodTest < Minitest::Test

  def test_initialization
    file_mock = Minitest::Mock.new
    def file_mock.each_line;["1;C;2,3", "2;B;6"].collect!;end
    net = Net.new('aa', nil)
    puts net.rev_arr
    assert_equal net.rev_arr, []
  end

  # def test_find_word_empty
  #   @net.rev_net[]
  #   result = @net.find_word
  #   assert result, []
  # end
  # Test that sort works
  

  # Test that sort works if the element will be moved to head
  
end
