require 'trie'
require_relative 'Net'
require_relative 'helper'

exit 1 unless check_args ARGV
t = Trie.read('newlist')
file = File.open(ARGV[0], "r")
net = Net.new(file,t)
list = net.find_word
puts 'RESULT >>>'
dict = read_dictionary
for x in list
	puts dict[x]
end



