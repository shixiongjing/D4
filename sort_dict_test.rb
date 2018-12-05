require 'minitest/autorun'
require_relative 'sort_dict'
require 'trie'

class DictSortedTest < Minitest::Test
    def setup
        @dict = DictSorted.new
        @t = Trie.new
    end

    def test_read_in
        assert_raises 'File does not exist' do 
           @dict.read_in("test") 
        end
    end

    def test_exist
        assert_equal true, @dict.read_in("wordlist.txt")
    end

    def test_save_called
        def @t.save; true end
        val = @dict.add_to_trie_index
        assert_equal true, val
    end

    def test_get_called
        def @t.get; true end
        val = @dict.add_to_trie_index
        assert_equal true, val
    end

    def test_add_called
        @dict.original << 'a'
        @dict.modified << 'a'
        def @t.add; true end
        def @t.get; true end
        val = @dict.add_to_trie_index
        assert_equal true, val
    end

end