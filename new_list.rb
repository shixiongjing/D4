require_relative 'sort_dict'

dict = DictSorted.new
dict.read_in 'wordlist.txt'
dict.add_to_trie_index
