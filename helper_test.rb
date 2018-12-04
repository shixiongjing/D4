require 'minitest/autorun'
require_relative 'helper'

class HelperMethodTest < Minitest::Test

  # Test that sort works
  def test_insert_sort
  	arr = ['a', 'g', 'l', 'p']
    char = 'j'
    assert insert_sort(arr, char), ['a', 'g', 'j', 'l', 'p']
  end

  # Test that sort works if the element will be moved to head
  def test_insert_sort_head
    arr = 'bcxz'
    char = 'a'
    assert insert_sort(arr, char), 'abcxz'
  end
end







