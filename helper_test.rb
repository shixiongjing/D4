require 'minitest/autorun'
require_relative 'helper'

class HelperMethodTest < Minitest::Test

  def test_check_empty_args
    test=[]
    val = check_args(test)
    assert_equal false, val
  end

  def test_check_more_than_one_args
    test=['a', 'b']
    val = check_args(test)
    assert_equal false, val
  end

  # Test that sort works
  def test_insert_sort
  	arr = 'ECK'
    char = 'A'
    assert insert_sort(arr, char), 'AECK'
  end

  # Test that sort works if the element will be moved to head
  def test_insert_sort_head
    arr = 'bcxz'
    char = 'a'
    assert insert_sort(arr, char), 'abcxz'
  end
end
