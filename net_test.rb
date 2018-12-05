require 'minitest/autorun'
require_relative 'net'

class HelperMethodTest < Minitest::Test

  def test_initialization
    file_mock = Minitest::Mock.new
    file_mock.expect(:each_line, ["1;C;2,3", "2;B;6"].to_enum(:each))
    temp_net = Net.new(file_mock, nil)
    puts temp_net.rev_arr
    assert_equal temp_net.rev_arr, []
  end
  # Test that sort works
  

  # Test that sort works if the element will be moved to head
  
end
