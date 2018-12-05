require 'trie'
require_relative 'Net'
require_relative 'helper'

exit 1 unless check_args ARGV
t = Trie.read('newlist')
f = File.open(ARGV[0], 'r')
net = Net.new(f, t)
list = net.find_word
puts 'RESULT >>>'
dict = read_dictionary
list.each do |x|
  puts dict[x]
end
