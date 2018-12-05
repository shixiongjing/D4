require 'trie'
require_relative 'Net'
require_relative 'helper'

exit 1 unless check_args ARGV
# Load trie storing (key, value) pair, where key is sorted word, value is index of original
# word in the original wordlist
t = Trie.read('newlist')
f = File.open(ARGV[0], 'r')
net = Net.new(f, t)
list = net.find_word
puts 'RESULT >>>'
# Get the index of longest words and fetch them from the wordlist
dict = read_dictionary
list.each do |x|
  puts dict[x]
end
