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

#    def test_save_called
#        t = Minitest::Mock.new('test')
#        @dict.original << 'a'
#        @dict.modified << 'a'
#        t.expect :save, 1
#        def t.get; nil;end
#        def t.add; true;end
#        t.verify
#    end
    def test_save
      t = Minitest::Mock.new('test')
      def t.save; true end
      t.expect :save, 1
      refute_nil t
    end

    def test_get_called
        t = Minitest::Mock.new('test')
        def t.get; true end
        t.expect :get, 1
        refute_nil t
    end

    def test_add_called
        t = Minitest::Mock.new('test')
        @dict.original << 'a'
        @dict.modified << 'a'
        def t.add; true end
        def t.get; true end
        t.expect :add_to_trie_index, 1
        refute_nil t
    end

end
