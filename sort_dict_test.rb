require 'minitest/autorun'
require_relative 'sort_dict'

class DictSortedTest < Minitest::Test
    def setup
        @dict = DictSorted.new
    end

    def test_read_in
        assert_raises 'File does not exist' do 
           @dict.read_in("test") 
        end
    end

    def test_exist
        assert_equal true, @dict.read_in("wordlist.txt")
    end

end