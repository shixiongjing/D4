require 'minitest/autorun'
require_relative 'helper'

class HelperMethodTest < Minitest::Test

  def test_check_empty_args
    test=[]
    val = check_args(test)
    assert_equal false, val
  end

  def test_check_two_args
    test=['a', 'b']
    val = check_args(test)
    assert_equal false, val
  end
  
  def test_check_three_args
      test=['a', 'b', 'd']
      val = check_args(test)
      assert_equal false, val
  end
  
  def test_check_four_args
      test=['a', 'b', 'd', 'z']
      val = check_args(test)
      assert_equal false, val
  end

  def test_check_one_arg
    test=['net.rb']
    val = check_args(test)
    assert_equal true, val
  end
  
  def test_not_exit
      test = ['uyhnuhgtfgt']
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
  
  def test_insert_single_char
      arr = 'c'
      char = 'b'
      assert insert_sort(arr, char), 'bc'
  end
  
  def test_insert_mix_char
      arr = 'cA'
      char = 't'
      assert insert_sort(arr, char), 'ctA'
  end
end
