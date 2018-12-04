require 'trie'

# Class that read in a dictionary
# Sort it and put into a new trie object
class DictSorted

  def initialize
    @original = []
    @modified = []
    @t = Trie.new
  end
  attr_accessor :original, :modified, :joined

  def read_in
    @original = File.readlines('wordlist.txt')
    @original = @original.collect{ strip }
    @modified = @original.map{ |word| word.chars.sort(&:casecmp).join }
  end

  def map_two
    i = 0
    while i < @original.length
      @t.add(@modified[i], @original[i])
      i += 1
    end
  end

  def export
    @t.save('newlist')
    puts @t.get("ab")
  end

end
