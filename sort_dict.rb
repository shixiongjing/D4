require 'trie'

# Class that read in a dictionary
# Sort it and put into a new trie object
class DictSorted
  def initialize
    @original = []
    @modified = []
    @t = Trie.new
  end
  attr_accessor :original, :modified, :t

  def read_in(filename)
    raise 'File does not exist' until File.exist?(filename)
    @original = File.readlines(filename)
    @original = @original.collect(&:strip)
    @modified = @original.map { |word| word.chars.sort(&:casecmp).join }
    true
  end

  def add_to_trie_index
    i = 0
    while i < @original.length
      # Same sorted word
      # If Path is different, add another node
      @modified[i] = @modified[i] + '.' until @t.get(@modified[i].upcase).nil?
      @t.add(@modified[i].upcase, i)
      i += 1
    end
    @t.save('newlist')
  end
end
